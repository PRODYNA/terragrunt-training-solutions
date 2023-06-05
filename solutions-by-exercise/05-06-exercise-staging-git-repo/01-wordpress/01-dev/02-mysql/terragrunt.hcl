#############
## INCLUDE ##
#############

include "global" {
  path   = "${get_repo_root()}/global.hcl"
  expose = true
}

include "env" {
  path   = "${find_in_parent_folders("env.hcl")}"
  expose = true
}

############
## SOURCE ##
############

terraform {
  source = "${include.global.locals.git_modules_source}mysql-db" # "${get_repo_root()}/modules/mysql-db//."
}

################
## DEPENDENCY ##
################

dependency "base" {
  config_path = "${get_repo_root()}/01-wordpress/01-dev/01-base"
}

############
## INPUTS ##
############

inputs = {
  mysql_name          = include.env.locals.mysql_name
  db_sku_name         = include.env.locals.db_sku_name
  db_subnet_id        = dependency.base.outputs.db_subnet_id
  private_dns_zone_id = dependency.base.outputs.private_dns_zone_id
  db_user             = include.env.locals.mysql_user
  db_pw               = include.env.locals.mysql_pw
}