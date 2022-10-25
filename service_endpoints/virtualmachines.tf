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
    azurerm_virtual_network.appnetwork,
    azurerm_public_ip.appip
  ]
}

resource "azurerm_public_ip" "appip" {
   name                = var.public_ip
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  depends_on = [
    azurerm_resource_group.appgrp
  ]
}


resource "azurerm_windows_virtual_machine" "appvm" {  
  name                = var.windows_virtual_machine
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password      = "Azure@123"
  network_interface_ids = [
    azurerm_network_interface.appinterface.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  depends_on = [
    azurerm_virtual_network.appnetwork,
    azurerm_network_interface.appinterface
  ]
}