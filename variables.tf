
variable "hypervisor" {
  description = "Hypervisor variables"
  type = object({
    host             = string
    port             = string
    proxmox_realm    = string
    proxmox_username = string
    proxmox_password = string
  })
}

variable "proxmox_cluster_nodes" {
  description = "Proxmox cluster nodes"
  type        = map(string)
}

variable "vm-hosts" {
  description = "VM Hosts"
  type = map(object({
    # proxmox_node: Which node in the Proxmox cluster to start the virtual machine on during creation.
    proxmox_node = string
    vm_id        = string
    # template_id: Template ID of the Starting Cloud Image.
    template_id = number
    # template_name: Template name of the Starting Cloud Image.

    # template_full_clone: True if a full clone is needed. false for a Linked clone
    template_full_clone = bool
    name                = string
    description         = string
    # cpu + memory
    cores   = number
    memory  = number # gigabyte
    sockets = number
    # disks
    disks        = list(number)
    storage_pool = string
    # network-ip
    ipv4          = string
    internal_ipv4 = optional(string)
    tags          = list(string)
    })
  )
}

variable "vm-network" {
  description = "VM Network"
  type = object({
    cidr        = string
    gw          = string
    name        = string
    interface   = string
    bridge      = string
    vlan_id     = number
    dns_servers = list(string)
    dns_domain  = string
    internal_gw = optional(string)
    internal_bridge = optional(string)
    # create_bridge = optional(bool)
  })
}

variable "vm-account" {
  description = "VM user"
  type = object({
    username    = string
    password    = string
    public_keys = string
  })
  default = {
    username    = null
    password    = null
    public_keys = null
  }
}
