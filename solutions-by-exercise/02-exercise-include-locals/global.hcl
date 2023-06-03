locals {
  resource_group_name = "tfstate-weu-prod-rg"
  subscription_id     = "e3073b20-f0fd-4a32-9112-c1280ffc637e"
}

remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    subscription_id      = local.subscription_id
    resource_group_name  = local.resource_group_name
    storage_account_name = "pdazuretraining99"
    container_name       = "tfstate"
    key                  = "${replace(path_relative_to_include(), "/[^0-9A-Za-z]/", "")}.tfstate"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}
EOF
}