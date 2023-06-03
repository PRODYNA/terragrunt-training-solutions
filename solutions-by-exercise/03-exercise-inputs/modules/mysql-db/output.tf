output "db_url" {
  value = azurerm_mysql_flexible_server.mysql.fqdn
}