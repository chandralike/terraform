#   we added domain name then change name record on godaddy

resource "azurerm_dns_zone" "manikantalorryservice" {
  name                = "manikantalorryservice.live"
  resource_group_name = local.resource_group_name
  depends_on = [
    azurerm_resource_group.appgrp
  ]
}
output "server_namess" {
    value = azurerm_dns_zone.manikantalorryservice.name_servers
  
}

resource "azurerm_dns_a_record" "load_balancer-record" {
  name                = "www"
  zone_name           = azurerm_dns_zone.manikantalorryservice.name
  resource_group_name = local.resource_group_name
  ttl                 = 360
  records             = [azurerm_public_ip.loadip.ip_address]
}