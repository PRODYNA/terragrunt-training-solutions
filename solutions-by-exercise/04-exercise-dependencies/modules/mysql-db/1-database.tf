###########
## MySQL ##
###########

resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = "${var.resource_prefix}-${var.mysql_name}"
  resource_group_name    = data.azurerm_resource_group.main.name
  location               = data.azurerm_resource_group.main.location
  administrator_login    = var.db_user
  administrator_password = var.db_pw
  backup_retention_days  = var.backup_retention_days
  delegated_subnet_id    = var.db_subnet_id
  private_dns_zone_id    = var.private_dns_zone_id
  sku_name               = var.db_sku_name
  zone                   = var.mysql_zone
}

resource "azurerm_mysql_flexible_server_configuration" "require_secure_transport" {
  name                = "require_secure_transport"
  resource_group_name = data.azurerm_resource_group.main.name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  value               = "OFF"
}
