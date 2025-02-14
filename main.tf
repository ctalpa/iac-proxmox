resource "random_password" "vm_user_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "tls_private_key" "vm_user_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


module "virtual_network" {

  for_each     = var.proxmox_cluster_nodes
  source       = "./module/proxmox_vn"
  proxmox_node = each.value
  vn_name      = var.vnetwork.name
  vn_interface = var.vnetwork.interface
  vn_cidr_ipv4 = var.vnetwork.cidr
  vn_vlan_id   = var.vnetwork.vlan_id
  vn_bridge    = var.vnetwork.bridge

}


module "virtual_machine" {

  for_each = var.vm-hosts

  source = "./module/proxmox_vm"

  # Proxmox Settings
  proxmox_node = each.value.proxmox_node

  ### VM Configuration
  vm_id                  = each.value.vm_id
  vm_template_id         = each.value.template_id
  vm_template_full_clone = each.value.template_full_clone
  vm_name                = each.value.name
  vm_description         = each.value.description

  # TAGS
  vm_tags = each.value.tags

  # CPU + MEMORY
  vm_cores   = each.value.cores
  vm_memory  = each.value.memory
  vm_sockets = each.value.sockets

  # DISKS
  vm_disks        = each.value.disks
  vm_storage_pool = each.value.storage_pool

  # NETWORK
  vm_network_ipv4       = each.value.ipv4
  vm_network_gateway    = var.vm-network.gw
  vm_network_bridge     = var.vm-network.bridge
  vm_network_dns_server = var.vm-network.dns_servers
  vm_network_dns_domain = var.vm-network.dns_domain

  vm_network_internal_ipv4    = each.value.internal_ipv4
  vm_network_internal_vlan_id = var.vnetwork.vlan_id
  vm_network_internal_gateway = var.vnetwork.gw
  vm_network_internal_bridge  = var.vnetwork.bridge


  ### Account Configuration ###
  vm_username        = var.vm-account.username != null ? var.vm-account.username : "devopsuser"
  vm_password        = var.vm-account.password != null ? var.vm-account.password : trimspace(random_password.vm_user_password.result)
  vm_user_public_key = var.vm-account.public_keys != null ? var.vm-account.public_keys : trimspace(tls_private_key.vm_user_key.public_key_openssh)

  depends_on = [module.virtual_network]
}
