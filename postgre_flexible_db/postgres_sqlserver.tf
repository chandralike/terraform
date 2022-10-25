
resource "azurerm_private_dns_zone" "dnszone" {
  name                = "${var.private_dns_zone_name}-pdz.postgres.database.azure.com"
  resource_group_name = var.resource_group_name

  depends_on = [azurerm_subnet_network_security_group_association.nsgassoc]
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnlink" {
  name                  = "${var.private_dns_zone_virtual_network_link_name}-pdzvnetlink.com"
  private_dns_zone_name = azurerm_private_dns_zone.dnszone.name
  virtual_network_id    = azurerm_virtual_network.appnetwork.id
  resource_group_name   = var.resource_group_name
  depends_on = [
    azurerm_resource_group.Main_Resource_group,
    azurerm_private_dns_zone.dnszone
  ]
}


resource "azurerm_postgresql_flexible_server" "postgresfls" {
  name                   = var.postgresql_flexible_server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "12"
  delegated_subnet_id    = azurerm_subnet.subnetB.id
  private_dns_zone_id    = azurerm_private_dns_zone.dnszone.id
  administrator_login    = "adminTerraform"
  administrator_password = "Azure@12345"
  zone                   = "2"
  storage_mb             = 32768
  sku_name               = "GP_Standard_D2s_v3"
  backup_retention_days  = 7
      tags = {
    name = var.postgresql_flexible_server_database_name
  }


   depends_on = [
    azurerm_resource_group.Main_Resource_group,
    azurerm_private_dns_zone_virtual_network_link.vnlink]

}