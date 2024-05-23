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

variable "vnet_cidr" {
  type        = string
  description = "CIDR of VNet"
}

variable "default_subnet_cidr" {
  type        = string
  description = "CIDR of default subnet"
}

variable "db_subnet_cidr" {
  type        = string
  description = "CIDR of db subnet"
}

variable "wordpress_instances" {
  type        = list(string)
  description = "List of Wordpress Instances"
  default     = ["i1"]
}