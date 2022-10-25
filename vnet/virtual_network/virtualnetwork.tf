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