###################
# Ressource Group #
###################





###################
# Virtual Network #
###################
resource "azurerm_virtual_network" "main" {
  name                = "vnet-training-1"
  resource_group_name = data.azurerm_resource_group.main.name
  address_space       = [var.vnet_cidr]
  location            = data.azurerm_resource_group.main.location
}

##########
# Subnet #
##########
resource "azurerm_subnet" "default" {
  name                 = "default"
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.default_subnet_cidr]
}

resource "azurerm_subnet" "db" {
  name                 = "db"
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.db_subnet_cidr]
  delegation {
    name = "mysql-fs"
    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

#######
# ASG #
#######
resource "azurerm_application_security_group" "web" {
  name                = "asg-web"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
}

#######
# NSG #
#######
resource "azurerm_network_security_group" "web" {
  name                = "nsg-web"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_network_security_rule" "ssh" {
  name      = "SSH"
  priority  = 100
  direction = "Inbound"
  access    = "Allow"
  protocol  = "Tcp"

  source_port_range     = "*"
  source_address_prefix = "*"

  destination_application_security_group_ids = [azurerm_application_security_group.web.id]
  destination_port_range                     = "22"

  resource_group_name         = data.azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.web.name
}

resource "azurerm_network_security_rule" "http" {
  name      = "HTTP"
  priority  = 110
  direction = "Inbound"
  access    = "Allow"
  protocol  = "Tcp"

  source_port_range     = "*"
  source_address_prefix = "*"

  destination_application_security_group_ids = [azurerm_application_security_group.web.id]
  destination_port_range                     = "80"

  resource_group_name         = data.azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.web.name
}

resource "azurerm_subnet_network_security_group_association" "default" {
  subnet_id                 = azurerm_subnet.default.id
  network_security_group_id = azurerm_network_security_group.web.id
}

#############
# Public IP #
#############
resource "azurerm_public_ip" "vm" {
  for_each = toset(local.instances)

  name                = "pip-traininig-1-${each.key}"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  sku               = "Basic"
  allocation_method = "Static"
}

####################
# Private DNS Zone #
####################
resource "azurerm_private_dns_zone" "mysql" {
  name                = "private.mysql.database.azure.com"
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "mysql" {
  name                  = "mysql"
  private_dns_zone_name = azurerm_private_dns_zone.mysql.name
  virtual_network_id    = azurerm_virtual_network.main.id
  resource_group_name   = data.azurerm_resource_group.main.name
}
