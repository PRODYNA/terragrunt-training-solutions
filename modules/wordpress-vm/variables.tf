variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to use"
}

variable "instance_id" {
  type        = string
  description = "ID of instance"
}

variable "subnet_id" {
  type        = string
  description = "ID of subnet"
}

variable "pip_id" {
  type        = string
  description = "ID of public IP"
}

variable "asg_id" {
  type        = string
  description = "ID of ASG"
}

variable "db_user" {
  type        = string
  description = "Username for the mysql database"
}

variable "db_pass" {
  type        = string
  description = "Password for the mysql database"
}

variable "db_url" {
  type        = string
  description = "Url to the mysql database"
}