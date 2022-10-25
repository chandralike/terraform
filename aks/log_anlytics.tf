
resource "azurerm_log_analytics_workspace" "akslogs" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
    depends_on = [
    azurerm_resource_group.Main_Resource_group
  ] 
}
resource "azurerm_log_analytics_solution" "test" {
  location              = var.location
  resource_group_name   = var.resource_group_name
  solution_name         = var.log_analytics_solution_name
  workspace_name        = azurerm_log_analytics_workspace.akslogs.name
  workspace_resource_id = azurerm_log_analytics_workspace.akslogs.id
  plan {
    product   = "OMSGallery/ContainerInsights"
    publisher = "Microsoft"
  }
}
