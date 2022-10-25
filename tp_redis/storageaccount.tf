resource "azurerm_storage_account" "tpstorage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
      tags = {
    name = var.storage_account_name
  }
  depends_on = [
    azurerm_resource_group.Main_Resource_group
  ] 
}
resource "azurerm_storage_account" "tpstorage2" {
  name                     = var.storage_account_name2
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
      tags = {
    name = var.storage_account_name2
  }
  depends_on = [
    azurerm_resource_group.Elastic_Search_Group
  ] 
}
