############
## LOCALS ##
############

locals {
  vnet_cidr           = "10.0.0.0/16"
  default_subnet_cidr = "10.0.0.0/24"
  db_subnet_cidr      = "10.0.1.0/24"

  wordpress_instances = [
    "i1",
  ]
  mysql_name  = "mysql-training-1" # please change    
  mysql_user  = "trainingadmin" # If wanted, put your own here
  mysql_pw    = "mysecret123!" # If wanted, put your own here
  db_sku_name = "B_Standard_B1ms"

  vm_user = "trainingadmin" # If wanted, put your own here
  vm_pw   = "mysecret123!" # If wanted, put your own here
}

inputs = {
  resource_prefix = "dev"
}