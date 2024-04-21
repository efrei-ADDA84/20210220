# This file contains the data sources that will be used in the main configuration file to get the information of the existing resources in Azure.

# Data source to get the information of the resource group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Data source to get the information of the virtual network
data "azurerm_virtual_network" "rg_vnet" {
  name                = var.network_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

# Data source to get the information of the subnet
data "azurerm_subnet" "rg_subnet" {
  name                 = var.internal_subnet_name_use
  virtual_network_name = data.azurerm_virtual_network.rg_vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}
