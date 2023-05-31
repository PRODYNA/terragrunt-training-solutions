include "global" {
  path   = "${get_repo_root()}/global.hcl"
  expose = true # needs to be true to access the locals from global.hcl
}

terraform {
  source = "${include.global.locals.git_modules_source}base" # "${get_repo_root()}/modules/base//." # get_repo_root returns the absolute path to the git root folder
}

inputs = {
  resource_group_name = include.global.locals.resource_group_name
  vnet_cidr           = include.global.locals.vnet_cidr
  default_subnet_cidr = include.global.locals.default_subnet_cidr
  db_subnet_cidr      = include.global.locals.db_subnet_cidr
}