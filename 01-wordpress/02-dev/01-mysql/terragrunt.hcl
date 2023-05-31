#############
## INCLUDE ##
#############

include "global" {
  path   = "${get_repo_root()}/global.hcl"
  expose = true
}

include "env" {
  path   = "${find_in_parent_folders(env.hcl)}"
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
  resource_group_name = dependency.base.outputs.resource_group_name
  db_subnet_cidr      = dependency.base.outputs.db_subnet_cidr # cidr or id?
  db_user = include.global.locals.mysql_user
  db_pw = include.global.locals.mysql_pw
}