# proxmox_vm
Terraform module for creating and virtual local area network and bridge resources on Proxmox Hypervisor
 

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

 
## Examples

```
module "virtual_network" {

  source       = "./module/proxmox_vn"

  proxmox_node = "prxmsaas01"
  vn_name      = "vlan_test"
  vn_interface = "ens5f0"
  vn_cidr_ipv4 = "10.90.10.1/24"
  vn_vlan_id   = 1
  vn_bridge    = "vmbr1"

}


}

```

 ### Depends
This module non depends from any the modules.



## Requirements

| Name | Version |
| --- | --- |
| terraform | >= 1.9.8 |

 

## Providers

| Name | Version |
| --- | --- |
| registry.terraform.io/bpg/proxmox | >= v0.64.0 |
| registry.terraform.io/hashicorp/random | >= v3.6.3 |
| registry.terraform.io/hashicorp/tls | >= v4.0.6 | 



## Input
N.A.

## Output
N.A.


## Help

 

**Got a question?**

WIP

 

## Contributing

 

### Bug Reports & Feature Requests

WIP

## Copyrights

Copyright © 2024 Carmine Talpa & Federico Augello