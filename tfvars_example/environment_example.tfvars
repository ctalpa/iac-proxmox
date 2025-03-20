
proxmox_cluster_nodes = { 
  node1 = {name="prxmsaas01", ipv4="10.90.20.11", vlan_ipv4="192.168.100.11"} 
  node2 = {name="prxmsaas-02", ipv4="10.90.20.12", vlan_ipv4="192.168.100.12" }

vm-hosts = {
  vm-1 = { proxmox_node = "prxmsaas02", vm_id = "5001", template_id = 9001, template_full_clone = true, name = "k8s-1", description = "vm created via terraform  devops 21", cores = 4, memory = 8, sockets = 1, disks = [10, 30], storage_pool = "local-lvm", ipv4 = "10.90.20.21/24", vlan_ipv4 = "192.168.100.41/24", tags = ["k8s", "control-plane", "test-infra", "terraform"] }
  vm-2 = { proxmox_node = "prxmsaas02", vm_id = "5002", template_id = 9001, template_full_clone = true, name = "k8s-2", description = "vm created via terraform  devops 22", cores = 4, memory = 8, sockets = 1, disks = [10, 30], storage_pool = "local-lvm", ipv4 = "10.90.20.22/24", vlan_ipv4 = "192.168.100.42/24", tags = ["k8s", "worker", "test-infra", "terraform"] }
  vm-3 = { proxmox_node = "prxmsaas02", vm_id = "5003", template_id = 9001, template_full_clone = true, name = "k8s-3", description = "vm created via terraform  devops 22", cores = 4, memory = 8, sockets = 1, disks = [10, 30], storage_pool = "local-lvm", ipv4 = "10.90.20.23/24", vlan_ipv4 = "192.168.100.43/24", tags = ["k8s", "worker", "test-infra", "terraform"] }
}


vm-network = {
  cidr        = "192.168.100.1/24"
  gw          = "192.168.100.1"
  bridge      = "vmbr0"  
  dns_servers = ["10.90.20.1"]
  dns_domain  = "dns-domain"
}



vnetwork = {
  name        = "vlan_test_node1"
  interface   = "ens3f0"
  cidr = "192.168.100.1/24"
  gw = ""     
  bridge      = "vmbr1"
  vlan_id     = 1
}