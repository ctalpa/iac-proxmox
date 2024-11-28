output "vm_user_key" {
  value = random_password.vm_user_key.result
}

output "vm_user_password" {
  value = random_password.vm_user_password.result
}
