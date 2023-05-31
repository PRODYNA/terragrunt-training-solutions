############
## LOCALS ##
############

locals {
  tags = {
    provisioner = "Terragrunt"
  }
  git_modules_source = "git::https://github.com/PRODYNA/terragrunt-training-modules.git//"

  vnet_cidr           = "10.0.0.0/16"
  default_subnet_cidr = "10.0.0.0/24"
  db_subnet_cidr      = "10.0.1.0/24"

  wordpress_instances = [
    "i1",
    "i2",
  ]
  mysql_user = "trainingadmin" # If wanted, put your own here
  mysql_pw = "mysecret123!" # If wanted, put your own here

}

############
## INPUTS ##
############

inputs = {
  resource_group_name  = "rg-training-1" # Input your own here
  subscription_id      = "3902cdee-a787-433e-b331-02b77bc9758c" # Input your own here
  storage_account_name = "pdazuretraining1" # Input your own here
  container_name       = "tf-state" # Input your own here

  location            = "westeurope"
  location_code       = "weu"
  company_name        = "Prodyna"
}

##################
## REMOTE STATE ##
##################

remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    subscription_id      = locals.subscription_id
    resource_group_name  = locals.resource_group_name
    storage_account_name = locals.storage_account_name
    container_name       = ""
    key                  = "${replace(path_relative_to_include(), "/[^0-9A-Za-z]/", "")}.tfstate"
  }
}

#####################
## PROVIDER CONFIG ##
#####################

generate "provider" {
 path = "provider.tf"
 if_exists = "overwrite"
 contents = <<EOF
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}
EOF
}
