# Azure Provider source and version being used
terraform {
  required_providers {
    azapi = {
            source  = "azure/azapi"
            version = "~>1.5"
        }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id      
}

# Configure the TLS Provider for generating SSH keys
provider "tls" { 
}