# proxmox_vm
Terraform module for creating and managing virtual machine resources on Proxmox Hypervisor
 

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

 
## Examples

```

module "virtual_machine" {

  source = "./module/proxmox_vm"

  # Proxmox Settings
  proxmox_node = "prxmsaas01"

  ### VM Configuration
  vm_id                  = "7001"
  vm_template_id         = 901
  vm_template_full_clone = true
  vm_name                = "vm-name"
  vm_description         = "vm-description"
  
  # TAGS
  vm_tags                = ["vm-tag1", "vm-tag2"]
  
  # CPU + MEMORY
  vm_cores   = 4
  vm_memory  = 8 # GB
  vm_sockets = 1
  
  # DISKS
  vm_disks        = [10, 30]  # GB
  vm_storage_pool = "local-lvm"

  # NETWORK
  vm_network_ipv4             = "10.90.10.21/24"
  vm_network_internal_ipv4    = "192.168.100.21/24"
  vm_network_gateway          = ""
  vm_network_bridge           = "vmbr1"
  vm_network_vlan_id          = 101
  vm_network_dns_server       = ["192.168.100.1"]
  vm_network_dns_domain       = "local.domain"
  vm_network_internal_gateway = "192.168.100.1"
  vm_network_internal_bridge  = "vmbr0"

  ### Account Configuration ###
  vm_username        = "username"
  vm_password        = "password-secret"
  vm_user_public_key = "ssh-public-key"

  depends_on = [module.virtual_network]
} 

```

 ### Depends
This module depends from the following modules:

* proxmox_vn : this module create bridge and vLAN in proxmox for more detail click [here](../proxmox_vn/README.md).



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