#############
## INCLUDE ##
#############

include "global" {
  path   = "${get_repo_root()}/global.hcl"
  expose = true # needs to be true to access the locals from global.hcl
}

############
## SOURCE ##
############

terraform {
  source = "${include.global.locals.git_modules_source}wordpress-vm" #"${get_repo_root()}/modules/wordpress-vm//."
}

################
## DEPENDENCY ##
################

dependency "base" {
  config_path = "${get_repo_root()}/01-wordpress/01-base"
}

dependency "mysql" {
  config_path = "${get_repo_root()}/01-wordpress/02-dev/01-mysql"
}

############
## INPUTS ##
############

inputs = {
  instances   = include.global.locals.wordpress_instances
  subnet_cidr = dependency.base.outputs.default_subnet_cidr
  subnet_id   = dependency.base.outputs.default_subnet_id
  pip_ids     = dependency.base.outputs.pip_ids
  asg_id      = dependency.base.outputs.asg_id
  db_user     = include.global.locals.mysql_user
  db_pw       = include.global.locals.mysql_pw
  db_url      = dependency.mysql.db_url
}