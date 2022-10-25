data "azurerm_kubernetes_service_versions" "current" {
  location = azurerm_resource_group.Main_Resource_group.location
  include_preview = false
}