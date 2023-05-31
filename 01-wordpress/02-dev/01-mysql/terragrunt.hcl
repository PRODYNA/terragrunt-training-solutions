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

dependency "governance" {
  config_path = "${get_repo_root()}/01-wordpress/01-base"
}

############
## INPUTS ##
############

inputs = {
  resource_group_name = include.global.locals.resource_group_name
  db_subnet_id        = dependency.base.outputs.db_subnet_id
  private_dns_zone_id = dependency.base.outputs.private_dns_zone_id
  db_user             = include.global.locals.mysql_user
  db_pw               = include.global.locals.mysql_pw
}