variable "proxmox_node" {
  type        = string
  description = "Which node in the Proxmox cluster to create virtual network and bridge."
  default     = "pve"
  nullable    = false
}


variable "vn_cidr_ipv4" {
  type        = string
  description = "The IPv4/CIDR address"
  nullable    = false
}

variable "vn_gateway_ipv4" {
  type        = string
  description = "IPv4 gateway address"
  default     = null
}

variable "vn_name" {
  type        = string
  description = "The interface name. If not specified Either the name will be equal 'Interface.VLAN tag number' e.g. ens18.21"
  default     = null
}

variable "vn_interface" {
  type        = string
  description = "The interface name."
  nullable    = false
}

variable "vn_bridge" {
  type        = string
  description = "The bridge name e.g vmbrN where N is number"
  nullable    = false
}

variable "vn_vlan_id" {
  type        = number
  description = "The VLAN tag."
  nullable    = false
}

variable "vn_mtu" {
  type        = number
  description = "The interface MTU."
  default     = 1500
}

variable "vn_vlan_aware" {
  type        = bool
  description = "Whether the interface bridge is VLAN aware."
  default     = true

}

# variable "create_bridge" {
#   type        = bool
#   description = "Create the bridge of the VLAN or not"
#   default     = true
# }
