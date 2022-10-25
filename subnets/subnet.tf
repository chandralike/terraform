resource "azurerm_subnet" "subnetA" {
  name           = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.subnet_address_space]
  depends_on = [
    azurerm_virtual_network.appnetwork
  ]
  }

resource "azurerm_subnet" "subnetB" {
  name           = var.subnet_name2
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.subnet_address_space2]
  depends_on = [
    azurerm_virtual_network.appnetwork
  ]
  }
resource "azurerm_subnet" "subnetC" {
  name           = var.subnet_name3
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.subnet_address_space3]
  depends_on = [
    azurerm_virtual_network.appnetwork
  ]
  }
  resource "azurerm_subnet" "subnetD" {
  name           = var.subnet_name4
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.subnet_address_space4]
  depends_on = [
    azurerm_virtual_network.appnetwork
  ]
  }
  resource "azurerm_subnet" "subnetE" {
  name           = var.subnet_name5
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.subnet_address_space5]
  depends_on = [
    azurerm_virtual_network.appnetwork
  ]
  }
