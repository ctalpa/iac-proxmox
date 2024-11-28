

resource "proxmox_virtual_environment_network_linux_vlan" "vlan" {

  node_name = var.proxmox_node
  name      = var.vn_name != null ? var.vn_name : "${var.vn_interface}.${var.vn_vlan_id}"
  interface = var.vn_interface
  vlan      = var.vn_vlan_id
  mtu       = var.vn_mtu
  comment   = "vlan on interface ${var.vn_interface} and vlantag ${var.vn_vlan_id}"
}

resource "proxmox_virtual_environment_network_linux_bridge" "bridge" {
  # count = var.create_bridge == true ? 1 : 0

  depends_on = [
    proxmox_virtual_environment_network_linux_vlan.vlan
  ]

  node_name = var.proxmox_node
  name      = var.vn_bridge

  address = var.vn_cidr_ipv4
  gateway = var.vn_gateway_ipv4

  comment    = "bridge on ${proxmox_virtual_environment_network_linux_vlan.vlan.name}"
  mtu        = var.vn_mtu
  vlan_aware = var.vn_vlan_aware

  ports = [
    "${proxmox_virtual_environment_network_linux_vlan.vlan.name}"
  ]
}
