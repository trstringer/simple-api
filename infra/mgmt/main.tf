variable "admin_name" {
  type = "string"
  description = "admin user name to create for the vm"
  default = "buildadmin"
}

resource "azurerm_resource_group" "mgmt" {
  name = "sa-mgmt-rg"
  location = "eastus"
}

resource "azurerm_virtual_network" "mgmtnet" {
  name = "vnet1"
  address_space = ["10.0.0.0/16"]
  location = "eastus"
  resource_group_name = "${azurerm_resource_group.mgmt.name}"
}

resource "azurerm_subnet" "mgmtsubnet" {
  name = "subnet1"
  resource_group_name = "${azurerm_resource_group.mgmt.name}"
  virtual_network_name = "${azurerm_virtual_network.mgmtnet.name}"
  address_prefix = "10.0.2.0/24"
}

resource "azurerm_network_interface" "mgmtnic" {
  name = "nic1"
  location = "eastus"
  resource_group_name = "${azurerm_resource_group.mgmt.name}"

  ip_configuration {
    name = "testconfiguration1"
    subnet_id = "${azurerm_subnet.mgmtsubnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id = "${azurerm_public_ip.mgmtip.id}"
  }
}

resource "azurerm_public_ip" "mgmtip" {
  name = "ip1"
  location = "eastus"
  resource_group_name = "${azurerm_resource_group.mgmt.name}"
  domain_name_label = "tfdevops"
  public_ip_address_allocation = "dynamic"
}

resource "azurerm_storage_account" "mgmtstor" {
  name = "tfteststor2"
  resource_group_name = "${azurerm_resource_group.mgmt.name}"
  location = "eastus"
  account_type = "Standard_LRS"

  tags {
    environment = "build"
  }
}

resource "azurerm_storage_container" "mgmtstorcontainer" {
  name = "vhds"
  resource_group_name = "${azurerm_resource_group.mgmt.name}"
  storage_account_name = "${azurerm_storage_account.mgmtstor.name}"
  container_access_type = "private"
}

resource "azurerm_virtual_machine" "mgmtvm" {
  name = "mgmtvm"
  location = "eastus"
  resource_group_name = "${azurerm_resource_group.mgmt.name}"
  network_interface_ids = ["${azurerm_network_interface.mgmtnic.id}"]
  vm_size = "Standard_A0"

  storage_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "14.04.2-LTS"
    version = "latest"
  }

  storage_os_disk {
    name = "osdisk1"
    vhd_uri = "${azurerm_storage_account.mgmtstor.primary_blob_endpoint}${azurerm_storage_container.mgmtstorcontainer.name}/myosdisk1.vhd"
    caching = "ReadWrite"
    create_option = "FromImage"
  }

  os_profile {
    computer_name = "samgmt"
    admin_username = "${var.admin_name}"
    admin_password = "unused"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys = [{
      path = "/home/${var.admin_name}/.ssh/authorized_keys"
      key_data = "${file("/home/trstringer/.ssh/id_rsa.pub")}"
    }]
  }

  tags {
    environment = "build"
  }
}
