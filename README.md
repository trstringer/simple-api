# Simple Devops [![Build Status](https://jenkinsvm1.eastus.cloudapp.azure.com/jenkins/job/tstringer/job/simple-api/job/master/badge/icon)](https://jenkinsvm1.eastus.cloudapp.azure.com/jenkins/job/tstringer/job/simple-api/job/master/)

## CI/CD Provisioning and Configuration

*To be added...*

## CI/CD

```
                                                                 +------------+
                                                                 |            |
+--------------+        +--------+         +------------+  fail  | notify     |
|              |        |        |  trigger|            +------->+ developers |
| develop      | push   | github |  build  | test code  |        |            |
| code locally +------->+ repo   +-------->+ in jenkins |        +------------+
|              |        |        |         |            +----->
+--------------+        +--------+         +------------+     |
                                                              |
                       success                                |
   <----------------------------------------------------------+
   |
   |   +----------------+        +-------------+     +--------------------+
   |   |                |        |             |     |                    |
   |   | provision      |        | deploy new  |     | deprovision old    |
   +-->+ infrastructure +------->+ version of  +---->+ infrastructure/app |
       |                |        | application |     |                    |
       +----------------+        |             |     +--------------------+
                                 +-------------+
```

The infrastructure provisioning is accomplished with Terraform.
