terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.64.0"
    }
  }

  backend "local" {
    path = "iac-provisioning.tfstate"
  }

  # backend "remote" {
  #   hostname = "artifactory.rancherinf.elt.elt"
  #   organization = "terraform-be-snapshot"
  #   workspaces {
  #     prefix = "iac-tst-"
  #   }

  # }
}

provider "proxmox" {
  endpoint = "https://${var.hypervisor.host}:${var.hypervisor.port}/"
  username = "${var.hypervisor.proxmox_username}@${var.hypervisor.proxmox_realm}"
  password = var.hypervisor.proxmox_password
  insecure = true
  min_tls  = "1.2"
}
