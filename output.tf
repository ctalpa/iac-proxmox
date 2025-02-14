output "vm_user_key" {
  value = tls_private_key.vm_user_key.public_key_openssh
}

output "vm_user_password" {
  value     = random_password.vm_user_password.result
  sensitive = true
}
