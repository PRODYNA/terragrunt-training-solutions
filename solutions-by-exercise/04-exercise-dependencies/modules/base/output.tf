output "default_subnet_id" {
  value = azurerm_subnet.default.id
}

output "db_subnet_id" {
  value = azurerm_subnet.db.id
}

output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.mysql.id
}

output "pip_ids" {
  value = [for v in azurerm_public_ip.vm : v.id] # values(azurerm_public_ip.vm)[*].id # this prints out a list ["",""] with ids
}

output "asg_id" {
  value = azurerm_application_security_group.web.id
}
