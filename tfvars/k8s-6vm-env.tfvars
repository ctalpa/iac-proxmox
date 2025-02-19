proxmox_cluster_nodes = {
  prxmsaas01 = "prxmsaas01",  
}

vm-hosts = {
      k8s-other-1 = { proxmox_node = "prxmsaas01", vm_id = 8001, template_id = 9002, template_full_clone = true, name = "k8s-other-1", description = "vm created via terraform Host: k8s-other-1, Name: k8s-other-1, Role: Controller, Infra: test_node1", cores = 4 , memory = 8 , sockets = 1, disks = [32], storage_pool = "local-lvm", ipv4 = "192.168.100.120/24",  internal_ipv4 = "10.90.20.90/24",  tags=["k8s", "terraform", "test_node1", "controller"] },
      k8s-other-2 = { proxmox_node = "prxmsaas01", vm_id = 8002, template_id = 9002, template_full_clone = true, name = "k8s-other-2", description = "vm created via terraform Host: k8s-other-2, Name: k8s-other-2, Role: Controller, Infra: test_node1", cores = 4 , memory = 8 , sockets = 1, disks = [32], storage_pool = "local-lvm", ipv4 = "192.168.100.121/24",  internal_ipv4 = "10.90.20.91/24",  tags=["k8s", "terraform", "test_node1", "controller"] },
      k8s-other-3 = { proxmox_node = "prxmsaas01", vm_id = 8003, template_id = 9002, template_full_clone = true, name = "k8s-other-3", description = "vm created via terraform Host: k8s-other-3, Name: k8s-other-3, Role: Controller, Infra: test_node1", cores = 4 , memory = 8 , sockets = 1, disks = [32], storage_pool = "local-lvm", ipv4 = "192.168.100.122/24",  internal_ipv4 = "10.90.20.92/24",  tags=["k8s", "terraform", "test_node1", "controller"] },
      k8s-other-4 = { proxmox_node = "prxmsaas01", vm_id = 8004, template_id = 9002, template_full_clone = true, name = "k8s-other-4", description = "vm created via terraform Host: k8s-other-4, Name: k8s-other-4, Role: Worker, Infra: test_node1", cores = 8 , memory = 16 , sockets = 1, disks = [32], storage_pool = "local-lvm", ipv4 = "192.168.100.123/24",  internal_ipv4 = "10.90.20.93/24",  tags=["k8s", "terraform", "test_node1", "worker"] },
      k8s-other-5 = { proxmox_node = "prxmsaas01", vm_id = 8005, template_id = 9002, template_full_clone = true, name = "k8s-other-5", description = "vm created via terraform Host: k8s-other-5, Name: k8s-other-5, Role: Worker, Infra: test_node1", cores = 8 , memory = 16 , sockets = 1, disks = [32], storage_pool = "local-lvm", ipv4 = "192.168.100.124/24",  internal_ipv4 = "10.90.20.94/24",  tags=["k8s", "terraform", "test_node1", "worker"] },
      k8s-other-6 = { proxmox_node = "prxmsaas01", vm_id = 8006, template_id = 9002, template_full_clone = true, name = "k8s-other-6", description = "vm created via terraform Host: k8s-other-6, Name: k8s-other-6, Role: Worker, Infra: test_node1", cores = 8 , memory = 16 , sockets = 1, disks = [32], storage_pool = "local-lvm", ipv4 = "192.168.100.125/24",  internal_ipv4 = "10.90.20.95/24",  tags=["k8s", "terraform", "test_node1", "worker"] }
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
