resource "azurerm_private_dns_zone" "dnszone" {
  name                = "dnszone"
  resource_group_name = var.resource_group_name2
  tags = {
    name = "dnszone"
    email="manikantalorryservice.live"

  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "virtual_network_link_example" {
  name                  = "exampleVnet.com"
  private_dns_zone_name = azurerm_private_dns_zone.dnszone.name
  virtual_network_id    = azurerm_virtual_network.appnetwork.id
  resource_group_name   = var.resource_group_name
}
resource "azurerm_virtual_network" "appnetwork" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_subnet" "subnetA" {
  name           = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.subnet_address_space]
  depends_on = [
    azurerm_virtual_network.appnetwork
  ]
  }

resource "azurerm_private_endpoint" "redis_pe_example" {
  name                = "redis-private-endpoint-ex"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.subnetA.id

   private_dns_zone_group {
    name                 = "privatednsrediszonegroup"
    private_dns_zone_ids = [azurerm_private_dns_zone.dnszone.id]
  }

  private_service_connection {
    name                           = "peconnection-example"
    private_connection_resource_id = azurerm_redis_cache.example.id
    is_manual_connection           = false
    subresource_names              = ["redisCache"]
  }
}
