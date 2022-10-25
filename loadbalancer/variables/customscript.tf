# The storage account will be used to store the script for Custom Script extension
#uploading IIS config file

resource "azurerm_storage_account" "tpstorage070909" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"  
  depends_on = [
    azurerm_resource_group.appgrp
  ]
}

resource "azurerm_storage_container" "tpdata" {
  name                  = var.storage_container_name
  storage_account_name  = var.storage_account_name
  container_access_type = "blob"
  depends_on=[
    azurerm_storage_account.tpstorage070909
    ]
}

resource "azurerm_storage_blob" "IISConfig" {
  name                   = "IIS_Config.ps1"
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = "Block"
  source                 = "IIS_Config.ps1"
   depends_on=[azurerm_storage_container.tpdata,
    azurerm_storage_account.tpstorage070909]
}


resource "azurerm_virtual_machine_extension" "vmextension" {
  count=  var.number_of_machines
  name                 = "appvm-extension${count.index}"
  virtual_machine_id   = azurerm_windows_virtual_machine.appvm[count.index].id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"
  depends_on = [
    azurerm_resource_group.appgrp,
    azurerm_windows_virtual_machine.appvm,
    azurerm_network_interface.appinterface,
    azurerm_storage_blob.IISConfig
  ]
  settings = <<SETTINGS
    {
        "fileUris": ["https://${azurerm_storage_account.tpstorage070909.name}.blob.core.windows.net/data/IIS_Config.ps1"],
          "commandToExecute": "powershell -ExecutionPolicy Unrestricted -file IIS_Config.ps1"     
    }
SETTINGS

}


/* 
to import state
terraform import azurerm_virtual_machine_extension.vmextension /subscriptions/ad97bd75-d7fd-4a83-ace8-9e677dc9cf65/resourceGroups/app-grp/providers/Microsoft.Compute/virtualMachines/appvm1/extensions/appvm-extension1
*/