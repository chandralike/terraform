resource "azurerm_postgresql_flexible_server_database" "tppsdb" {
  name      = var.postgresql_flexible_server_database_name
  server_id = azurerm_postgresql_flexible_server.postgresfls.id
  collation = "en_US.UTF8"
  charset   = "UTF8"
  
}