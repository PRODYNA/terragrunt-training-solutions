terraform {
  source = "../../modules/wordpress-vm//."
}

include "global" {
  path   = "../../global.hcl"
  expose = true
}

inputs = {
  instances = include.global.locals.wordpress_instances
  subnet_id = dependency.base.outputs.default_subnet_id
  pip_ids   = dependency.base.outputs.pip_ids
  asg_id    = dependency.base.outputs.asg_id
  db_user   = include.global.locals.mysql_user
  db_pw     = include.global.locals.mysql_pw
  db_url    = dependency.mysql.outputs.db_url
  vm_user   = "trainingadmin" # If wanted, put your own here
  vm_pw     = "mysecret123!"  # If wanted, put your own here
}
 
dependency "base" {
  config_path = "${get_repo_root()}/01-wordpress/01-base"
}

dependency "mysql" {
  config_path = "${get_repo_root()}/01-wordpress/02-mysql"
}