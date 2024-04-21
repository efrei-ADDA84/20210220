# This file contains variable definitions for the infrastructure configuration.
# It defines variables such as admin_username, id_efrei, and internal_subnet_name_use.

variable "admin_username" {
  description = "Username for the VM admin user."
  default     = "devops"
  type        = string
}

variable "id_efrei" {
  description = "Identifiant Efrei."
  default     = "20210220"
  type        = string
}

variable "internal_subnet_name_use" {
  description = "Name of the subnet to use."
  default     = "internal"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key file."
  default     = "C:/Users/lisay/.ssh/id_rsa.pub"
  type        = string
  
}