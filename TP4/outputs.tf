# This file contains the outputs of the Terraform configuration.

# Output the public IP address of the virtual machine
output "public_ip_address" {
  value = azurerm_public_ip.vm_pip.ip_address
}
