resource "azurerm_availability_set" "appset" {
  name                = var.availability_set
  location            = var.location
  resource_group_name = var.resource_group_name
  platform_fault_domain_count = 3
  platform_update_domain_count = 3  
  depends_on = [
    azurerm_resource_group.appgrp
  ]
}