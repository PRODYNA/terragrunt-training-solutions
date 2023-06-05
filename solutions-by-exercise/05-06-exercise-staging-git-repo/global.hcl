############
## LOCALS ##
############

locals {
  tags = {
    provisioner = "Terragrunt"
  }
  git_modules_source = "git::https://github.com/PRODYNA/terragrunt-training-modules.git//modules/"

  resource_group_name  = "tfstate-weu-prod-rg"                  #"rg-training-1" # Input your own here
  subscription_id      = "e3073b20-f0fd-4a32-9112-c1280ffc637e" #"3902cdee-a787-433e-b331-02b77bc9758c" # Input your own here
  storage_account_name = "pdazuretraining99"                    #"pdazuretraining1" # Input your own here
  container_name       = "tfstate"                              # Input your own here
}

############
## INPUTS ##
############

inputs = {
  subscription_id     = local.subscription_id
  resource_group_name = local.resource_group_name
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
    subscription_id      = local.subscription_id
    resource_group_name  = local.resource_group_name
    storage_account_name = local.storage_account_name
    container_name       = local.container_name
    key                  = "${replace(path_relative_to_include(), "/[^0-9A-Za-z]/", "")}.tfstate"
  }
}

#####################
## PROVIDER CONFIG ##
#####################

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
