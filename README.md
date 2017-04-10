# Simple Devops [![Build Status](https://travis-ci.org/tstringer/simple-api.svg?branch=master)](https://travis-ci.org/tstringer/simple-api)

## CI/CD Provisioning and Configuration

*To be continued...*

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
