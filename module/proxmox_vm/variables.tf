#### Locals ####
locals {
  supported_bioses = ["ovmf", "seabios"]
  supported_oses   = ["l24", "l26", "other", "solaris", "w2k", "w2k3", "w2k8", "win7", "win8", "win10", "win11", "wvista", "wxp"]
}

#### Proxmox Settings #####
variable "proxmox_node" {
  type        = string
  description = "Which node in the Proxmox cluster to start the virtual machine on during creation."
  default     = "pve"
  nullable    = false
}

#### VM Settings #####
variable "vm_id" {
  type        = number
  description = "The ID of the VM in Proxmox. `null` indicates the next available ID."
  nullable    = false
}

variable "vm_template_id" {
  type        = number
  description = "Id of the VM template to clone from."
}

variable "vm_template_full_clone" {
  type        = bool
  description = "Set to true to create a full clone, or false to create a linked clone."
  default     = false
  nullable    = false
}

variable "vm_name" {
  type        = string
  description = "The virtual machine name."
}

variable "vm_description" {
  type        = string
  description = "The virtual machine description."
}

variable "vm_tags" {
  type        = list(string)
  description = "A list of tags to attach to the VM"
  default     = []
  nullable    = false
}

variable "vm_start_on_boot" {
  type        = bool
  description = "Specifies whether the VM will be started during system bootup."
  default     = true
  nullable    = false
}

variable "vm_started" {
  type        = bool
  description = "Specifies whether the VM will be started after provisioning ."
  default     = true
  nullable    = false
}

variable "vm_bios" {
  type        = string
  description = "Specifies the BIOS to use."
  default     = "seabios"
  nullable    = false

  validation {
    condition = (
      contains(local.supported_bioses, var.vm_bios)
    )
    error_message = "The vm_bios must be one of the following: ${jsonencode(local.supported_oses)}"
  }
}

variable "vm_os" {
  type        = string
  description = "Specifies the OS to use."
  default     = "other"
  nullable    = false

  validation {
    condition = (
      contains(local.supported_oses, var.vm_os)
    )
    error_message = "The vm_os must be one of the following: ${jsonencode(local.supported_oses)}"
  }
}

variable "vm_sockets" {
  type        = number
  description = "How many CPU sockets to give the virtual machine."
  default     = 1
  nullable    = false
}

variable "vm_cores" {
  type        = number
  description = "How many CPU cores to give the virtual machine."
  default     = 1
  nullable    = false
}

variable "vm_memory" {
  type        = number
  description = "How much memory, in gigabytes, to give the virtual machine."
  default     = 1
  nullable    = false
}

variable "vm_disks" {
  type        = list(number)
  description = "A list of sizes (GB) of disks to attach to the VM"
  default     = []
  nullable    = false
}

variable "vm_storage_pool" {
  type        = string
  description = "Name of the Proxmox storage pool to store the virtual machine disks on."
  default     = "local-lvm"
  nullable    = false
}

variable "vm_network_bridge" {
  type        = string
  description = "Which Proxmox bridge to attach the adapter to."
  default     = "vmbr0"
  nullable    = false
}

variable "vm_network_ipv4" {
  type        = string
  description = "The IP address with CIDR block for the primary network interface (eg. 192.168.1.1/24). Also can set as dhcp."
  default     = "dhcp"
  nullable    = false
}

variable "vm_network_gateway" {
  type        = string
  description = "The network gateway to use for the primary network interface. Ignored if vm_network_ipv4 = dhcp."
  default     = null
}

variable "vm_network_dns_server" {
  type        = list(string)
  description = "The list of dns server."
  default     = null
}

variable "vm_network_dns_domain" {
  type        = string
  description = "The dns domain to use for the primary network interface."
  default     = null
}

variable "vm_network_internal_vlan_id" {
  type        = number
  description = "The VLAN identifier"
  default     = null
}


variable "vm_network_internal_gateway" {
  type        = string
  description = "The network gateway to use for the primary network interface. Ignored if vm_network_ipv4 = dhcp."
  default     = null
}


variable "vm_network_internal_ipv4" {
  type        = string
  description = "The IP address with CIDR block for the primary network interface (eg. 192.168.1.1/24). Also can set as dhcp."
  default     = "dhcp"
  # nullable    = false
}

variable "vm_network_internal_bridge" {
  type        = string
  description = "Which Proxmox bridge to attach the adapter to."
  default     = "vmbr0"
  # nullable    = false
}

variable "vm_username" {
  type        = string
  description = "The default username."
  nullable    = false
}

variable "vm_password" {
  type        = string
  description = "The default user password."
  nullable    = false
}

variable "vm_user_public_key" {
  type        = string
  description = "The default user public key."
  nullable    = true
}
