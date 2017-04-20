variable "ssh_public_key" {
  description = "ssh public key"
}

module "linuxvm" {
  source = "github.com/tstringer/terraform-azure-linux-vm"

  name_prefix    = "simpleapi1"
  hostname       = "sa12345"
  ssh_public_key = "${var.ssh_public_key}"
}

output "admin_username" {
  value = "${module.linuxvm.admin_username}"
}

output "vm_fqdn" {
  value = "${module.linuxvm.vm_fqdn}"
}
