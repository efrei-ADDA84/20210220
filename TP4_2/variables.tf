# This file contains variable definitions for the infrastructure configuration.

variable "subscription_id" {
  description = "The Azure subscription ID."
  default     = "765266c6-9a23-4638-af32-dd1e32613047"
  type        = string
}

variable "tenant_id" {
    type        = string
    default     = "413600cf-bd4e-4c7c-8a61-69e73cddf731"
}

variable "resource_group_name" {
  description = "Name of the resource group use."
  default     = "ADDA84-CTP"
  type        = string
}

variable "network_name" {
  description = "Name of the virtual network."
  default     = "network-tp4"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the resources."
  default     = "francecentral"
  type        = string
}

variable "admin_username" {
  description = "Username for the VM admin user."
  default     = "devops"
  type        = string
}

variable "id_efrei" {
  description = "My Identifiant Efrei."
  default     = "20210220"
  type        = string
}

variable "internal_subnet_name_use" {
  description = "Name of the subnet to use."
  default     = "internal"
  type        = string
}

variable "allocation_method" {
  description = "The allocation method for the public IP."
  default     = "Dynamic"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key file."
  default     = "C:/Users/lisay/.ssh/id_rsa.pub"
  type        = string
  
}

