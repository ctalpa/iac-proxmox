
resource "proxmox_virtual_environment_vm" "proxmox_vm" {

  ### Proxmox Settings ###
  node_name = var.proxmox_node

  ### VM Settings ###
  vm_id = var.vm_id
  clone {
    vm_id        = var.vm_template_id
    datastore_id = var.vm_storage_pool
    full         = var.vm_template_full_clone # undocumented https://github.com/bpg/terraform-provider-proxmox/issues/551
  }
  name        = var.vm_name
  description = var.vm_description
  tags        = formatlist(lower("%s"), var.vm_tags)

  on_boot = var.vm_start_on_boot
  started = var.vm_started
  boot_order = [ # boot from virtio0 (boot disk), and ide2 (cloudinit)
    "scsi0",
    #"virtio0",
    "ide2",
    "net0",
  ]

  agent { # qemu agent
    enabled = true
  }

  ### CPU, Memory ###
  cpu {
    sockets = var.vm_sockets
    cores   = var.vm_cores
  }
  memory {
    dedicated = var.vm_memory * 1024
  }

  ### Disk ###
  scsi_hardware = "virtio-scsi-pci"
  bios          = var.vm_bios
  ## required if bios = ovmf, but gives errors because efi disk was provisioned in packer template:
  # ## "resizing of efidisks is not supported"
  dynamic "efi_disk" {
    for_each = var.vm_bios == "ovmf" ? [1] : []
    content {
      datastore_id = var.vm_storage_pool
      file_format  = "raw"
      type         = "4m"
    }
  }
  operating_system {
    type = var.vm_os
  }
  dynamic "disk" {
    for_each = var.vm_disks
    content {
      interface    = "scsi${disk.key}"
      datastore_id = var.vm_storage_pool
      size         = disk.value
      file_format  = "raw"
      iothread     = false
    }
  }

  ### Network ###
  network_device {
    model   = "virtio"
    bridge  = var.vm_network_bridge
    vlan_id = var.vm_network_vlan_id
  }

  dynamic "network_device" {
    for_each = var.vm_network_internal_bridge == "vmbr0" ? [1] : []
    content {
      model  = "virtio"
      bridge = var.vm_network_internal_bridge
    }
  }

  ### VGA ###
  vga {
    memory = 16
    type   = "serial0"
  }

  serial_device {}

  ### Cloud-init ###
  initialization {
    datastore_id = var.vm_storage_pool
    interface    = "ide2" # cloud-init drive
    ip_config {
      ipv4 {
        address = var.vm_network_ipv4
        gateway = (var.vm_network_ipv4 == "dhcp") ? null : var.vm_network_gateway
      }
    }
    dynamic "ip_config" {
      for_each = var.vm_network_internal_bridge == "vmbr0" ? [1] : []
      content {
        ipv4 {
          address = var.vm_network_internal_ipv4
          gateway = (var.vm_network_internal_ipv4 == "dhcp") ? null : var.vm_network_internal_gateway
        }
      }
    }
    dns {
      servers = var.vm_network_dns_server
      domain  = var.vm_network_dns_domain
    }
    user_account {
      username = var.vm_username
      password = var.vm_password
      keys     = [trimspace(var.vm_user_public_key)]
    }
  }

  lifecycle {
    ignore_changes = [
      clone,
      boot_order,
      disk[0].discard, # adding additional entries as we can't use wildcard here
      disk[1].discard,
      disk[2].discard,
      disk[3].discard,
      disk[4].discard,
      disk[5].discard,
      efi_disk,
      initialization,
    ]
  }
}
