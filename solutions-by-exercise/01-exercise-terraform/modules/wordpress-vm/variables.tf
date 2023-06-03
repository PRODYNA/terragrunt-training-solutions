variable "resource_prefix" {
  type = string
  description = "Prefix for the azure resources"
}

variable "subscription_id" {
  type = string
  description = "ID of subscription to deploy to"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to use"
}

variable "instances" {
  type        = list
  description = "List of Wordpress Instances"
}

variable "subnet_id" {
  type        = string
  description = "ID of subnet"
}

variable "pip_ids" {
  type = list(string)
  description = "IDs of public IPs"
}

variable "asg_id" {
  type        = string
  description = "ID of ASG"
}

variable "db_user" {
  type = string
  description = "Password for the DB"
}

variable "db_pw" {
  type = string
  description = "Username for the DB"
}

variable "db_url" {
  type        = string
  description = "Url to the mysql database"
}

variable "vm_user" {
  type = string
  description = "Password for the DB"
}

variable "vm_pw" {
  type = string
  description = "Username for the DB"
}