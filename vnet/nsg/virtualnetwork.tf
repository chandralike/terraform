/*
creation of network interface and pravite ip
we also added output fuction where we get subnetA-id in terminal
attachment of publi ip
*/

resource "azurerm_virtual_network" "appnetwork" {
  name                = "${var.virtual_network}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.virtual_network_address_space]

    
   depends_on = [
     azurerm_resource_group.appgrp
   ]
  }
 

  resource "azurerm_subnet" "subnetA" {
  name                 = local.subnets[0].name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network
  address_prefixes     = [local.subnets[0].address_prefix]
  depends_on = [
    azurerm_virtual_network.appnetwork
  ]
}

  resource "azurerm_subnet" "subnetB" {
  name                 = local.subnets[1].name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network
  address_prefixes     = [local.subnets[1].address_prefix]
  depends_on = [
    azurerm_virtual_network.appnetwork
  ]
}


resource "azurerm_network_interface" "appinterface" {
  name                = var.network_interface
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetA.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.appip.id

  }
  depends_on = [
    azurerm_subnet.subnetA
  ]
}
