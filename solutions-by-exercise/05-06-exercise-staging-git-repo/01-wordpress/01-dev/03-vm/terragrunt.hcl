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
  source = "${include.global.locals.git_modules_source}wordpress-vm" #"${get_repo_root()}/modules/wordpress-vm//."
}

################
## DEPENDENCY ##
################

dependency "base" {
  config_path = "${get_repo_root()}/01-wordpress/01-dev/01-base"
}

dependency "mysql" {
  config_path = "${get_repo_root()}/01-wordpress/01-dev/02-mysql"
}

############
## INPUTS ##
############

inputs = {
  instances = include.env.locals.wordpress_instances
  subnet_id = dependency.base.outputs.default_subnet_id
  pip_ids   = dependency.base.outputs.pip_ids
  asg_id    = dependency.base.outputs.asg_id
  db_user   = include.env.locals.mysql_user
  db_pw     = include.env.locals.mysql_pw
  db_url    = dependency.mysql.outputs.db_url
  vm_user   = include.env.locals.vm_user
  vm_pw     = include.env.locals.vm_pw
}