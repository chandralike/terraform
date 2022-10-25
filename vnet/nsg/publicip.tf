resource "azurerm_public_ip" "appip" {
  name                = var.public_ip
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
 depends_on = [
   azurerm_resource_group.appgrp
 ]
}