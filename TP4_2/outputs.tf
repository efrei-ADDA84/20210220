# This file contains the outputs of the Terraform configuration.

# Output the public IP address of the virtual machine
output "public_ip_address" {
  value = azurerm_public_ip.vm_pip.ip_address
}

# Output the private key in PEM format
output "private_key_pem" {
  value = tls_private_key.tls_key.private_key_pem
  sensitive = true
}

# Output the public key in OpenSSH format
output "public_key_openssh" {
  value = tls_private_key.tls_key.public_key_openssh
}

