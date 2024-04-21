data "azurerm_resource_group" "rg" {
  name = "ADDA84-CTP"
}

data "azurerm_virtual_network" "rg_vnet" {
  name                = "network-tp4"
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "rg_subnet" {
  name                 = var.internal_subnet_name_use
  virtual_network_name = data.azurerm_virtual_network.rg_vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}
