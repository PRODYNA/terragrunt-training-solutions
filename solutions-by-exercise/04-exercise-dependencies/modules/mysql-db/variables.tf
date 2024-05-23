variable "resource_prefix" {
  type        = string
  description = "Prefix for the azure resources"
  default     = "dev"
}

variable "subscription_id" {
  type        = string
  description = "ID of subscription to deploy to"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to use"
}

variable "db_subnet_id" {
  type        = string
  description = "Id of the subnet where to deploy the DB"
}

variable "private_dns_zone_id" {
  type        = string
  description = "Id of the private dns zone to use for the DB"
}

variable "mysql_name" {
  type        = string
  description = "Name of the MySQL"
}

# sometimes the zone is not available, just destroy the resource and change the zone
variable "mysql_zone" {
  type        = number
  description = "Zone where to deploy, can be 1,2 or 3"
  default     = 2
}

variable "backup_retention_days" {
  type        = number
  description = "How long to keep backups in days"
  default     = 7
}

variable "db_sku_name" {
  type        = string
  default     = "B_Standard_B1ms"
  description = "Name of the SKU to use for the MySQL"
}

variable "db_user" {
  type        = string
  description = "Password for the DB"
}

variable "db_pw" {
  type        = string
  description = "Username for the DB"
}