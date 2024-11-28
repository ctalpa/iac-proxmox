
proxmox_cluster_nodes = { "node1" = "prxmsaas01", "node2" = "prxmsaas02" }

vm-hosts = {
  vm-k8s-1 = { proxmox_node = "prxmsaas02", vm_id = "7001", template_id = 9001, template_full_clone = true, name = "k8s-1", description = "vm created via terraform  devops 21", cores = 4, memory = 8, sockets = 1, disks = [10, 30], storage_pool = "local-lvm", ipv4 = "10.90.10.21/24", internal_ipv4 = "192.168.100.21/24", tags = ["k8s", "control-plane", "test-infra", "terraform"] }
  vm-k8s-2 = { proxmox_node = "prxmsaas02", vm_id = "7002", template_id = 9001, template_full_clone = true, name = "k8s-2", description = "vm created via terraform  devops 22", cores = 4, memory = 8, sockets = 1, disks = [10, 30], storage_pool = "local-lvm", ipv4 = "10.90.10.22/24", internal_ipv4 = "192.168.100.22/24", tags = ["k8s", "worker", "test-infra", "terraform"] }
  vm-k8s-3 = { proxmox_node = "prxmsaas02", vm_id = "7003", template_id = 9001, template_full_clone = true, name = "k8s-3", description = "vm created via terraform  devops 22", cores = 4, memory = 8, sockets = 1, disks = [10, 30], storage_pool = "local-lvm", ipv4 = "10.90.10.23/24", internal_ipv4 = "192.168.100.23/24", tags = ["k8s", "worker", "test-infra", "terraform"] }
}

vm-network = {
  cidr        = "10.90.10.1/24"
  gw          = ""
  name        = "vlan_test"
  interface   = "ens5f0"
  bridge      = "vmbr1"
  vlan_id     = 1
  dns_servers = ["192.168.100.1"]
  dns_domain  = "local.domain"
  internal_gw = "192.168.100.1"
}
