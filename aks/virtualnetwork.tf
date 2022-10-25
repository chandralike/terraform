
resource "azurerm_virtual_network" "appnetwork" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.virtual_network_address_space]
      tags = {
    name = var.virtual_network_name
  }

    
   depends_on = [
     azurerm_resource_group.Main_Resource_group
   ]
  }
resource "azurerm_subnet" "subnetA" {
  name           = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.subnet_address_space]
  depends_on = [
    azurerm_virtual_network.appnetwork
  ]
  }
