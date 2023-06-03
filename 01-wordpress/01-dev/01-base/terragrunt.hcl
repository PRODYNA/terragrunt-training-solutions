#############
## INCLUDE ##
#############

include "global" {
  path   = "${get_repo_root()}/global.hcl"
  expose = true # needs to be true to access the locals from global.hcl
}

include "env" {
  path   = "${find_in_parent_folders("env.hcl")}"
  expose = true
}

############
## SOURCE ##
############

terraform {
  source = "${include.global.locals.git_modules_source}base" # "${get_repo_root()}/modules/base//." # get_repo_root returns the absolute path to the git root folder
}

############
## INPUTS ##
############

inputs = {
  wordpress_instances = include.env.locals.wordpress_instances
  vnet_cidr           = include.env.locals.vnet_cidr
  default_subnet_cidr = include.env.locals.default_subnet_cidr
  db_subnet_cidr      = include.env.locals.db_subnet_cidr
}