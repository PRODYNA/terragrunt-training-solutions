terraform {
  source = "../../modules/base//."
}

include "global" {
  path   = "../../global.hcl"
  expose = true
}

inputs = {
  wordpress_instances = include.global.locals.wordpress_instances
  vnet_cidr           = "10.0.0.0/16"
  default_subnet_cidr = "10.0.0.0/24"
  db_subnet_cidr      = "10.0.1.0/24"
}