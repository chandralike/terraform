resource "azurerm_storage_account" "vmstore4578" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"  

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["136.185.240.187"]
    virtual_network_subnet_ids = [azurerm_subnet.subnetA.id]
  }

    depends_on = [
    azurerm_resource_group.appgrp,
    azurerm_subnet.subnetA
   ]
}

resource "azurerm_storage_container" "data" {
  name                  = var.storage_container_name
  storage_account_name  = var.storage_account_name
  container_access_type = "blob"
  depends_on=[
    azurerm_storage_account.vmstore4578
    ]
}

resource "azurerm_storage_blob" "IISConfig" {
  name                   = "IIS_Config.ps1"
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = "Block"
  source                 = "IIS_Config.ps1"
   depends_on=[azurerm_storage_container.data]
}

# acess storage account through service end pionts first deny all and adding network rules
# download rdp enable enhance security rules intall azure storade explorer go to acesss key and connect storage account name and key.