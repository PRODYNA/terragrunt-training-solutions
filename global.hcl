locals {
  tags = {
    provisioner = "Terraform"
    environment = "prod"
  }

  subscription_id     = "3902cdee-a787-433e-b331-02b77bc9758c"
  resource_group_name = "rg-training-1"
  vnet_cidr           = "10.0.0.0/16"
  default_subnet_cidr = "10.0.0.0/24"
  db_subnet_cidr      = "10.0.1.0/24"

  wordpress_instances = [
    "i1",
    "i2",
  ]
}

inputs = {
  location      = "westeurope"
  location_code = "weu"
  company_name  = "Krohne"
  env           = "prod"
}

remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    subscription_id      = locals.subscription_id
    resource_group_name  = locals.resource_group_name
    storage_account_name = ""
    container_name       = ""
    key                  = "${replace(path_relative_to_include(), "/[^0-9A-Za-z]/", "")}.tfstate"
  }
}

## TODO
terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3"
    }
  }
}

## TODO

terraform {
  required_version = ">= 1.0"
  backend "azurerm" {
    subscription_id      = "3902cdee-a787-433e-b331-02b77bc9758c"
    resource_group_name  = "rg-traininig-1"
    storage_account_name = "pdazuretraining1"
    container_name       = "tf-state"
    key                  = "azure-terraform-training.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.2.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}