
output "vlan_name" {
  value = proxmox_virtual_environment_network_linux_vlan.vlan.name
}
output "vlan_description" {
  value = proxmox_virtual_environment_network_linux_vlan.vlan.comment
}

output "bridge_name" {
  # value = proxmox_virtual_environment_network_linux_bridge.bridge[*].name
  value = proxmox_virtual_environment_network_linux_bridge.bridge.name
}
