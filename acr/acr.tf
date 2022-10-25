resource "azurerm_container_registry" "acr" {
  name     = var.acr_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = "Standard"
  public_network_access_enabled = true
  admin_enabled            = true
      tags = {
    name = var.acr_name
  }
}