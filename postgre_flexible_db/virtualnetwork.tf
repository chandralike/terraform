/*
creation of virtual network and assign two subnets
*/

resource "azurerm_virtual_network" "appnetwork" {
  name                = var.virtual_network_name
  address_space       = [var.virtual_network_address_space]
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on = [
    azurerm_resource_group.Main_Resource_group
  ]

}
resource "azurerm_subnet" "subnetB" {
  name                 =  var.subnet_name2
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.subnet_address_space2]
  service_endpoints    = ["Microsoft.Storage"]
  depends_on = [
    azurerm_resource_group.Main_Resource_group
  ]

  delegation {
    name = "fs"

    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}


resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  depends_on = [
    azurerm_resource_group.Main_Resource_group
  ]
}




resource "azurerm_subnet_network_security_group_association" "nsgassoc" {
  subnet_id                 = azurerm_subnet.subnetB.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}