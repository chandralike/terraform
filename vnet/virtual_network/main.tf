resource "azurerm_resource_group" "Main_Resource_group" {
  name     = var.resource_group_name
  location = var.location
    tags = {
    name = var.resource_group_name
  }
}

resource "azurerm_resource_group" "Elastic_Search_Group" {
  name     = var.resource_group_name2
  location = var.location
    tags = {
    name = var.resource_group_name2
  }
}