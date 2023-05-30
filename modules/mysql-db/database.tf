#########
# MySQL #
#########
resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = "mysql-training-1"
  resource_group_name    = data.azurerm_resource_group.main.name
  location               = data.azurerm_resource_group.main.location
  administrator_login    = "trainingadmin"
  administrator_password = "mysecret123!"
  backup_retention_days  = 7
  delegated_subnet_id    = azurerm_subnet.db.id
  private_dns_zone_id    = azurerm_private_dns_zone.mysql.id
  sku_name               = "B_Standard_B1ms"
  zone                   = 1

  depends_on = [azurerm_private_dns_zone_virtual_network_link.mysql]
}

resource "azurerm_mysql_flexible_server_configuration" "require_secure_transport" {
  name                = "require_secure_transport"
  resource_group_name = data.azurerm_resource_group.main.name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  value               = "OFF"
}
