include "global" {
  path   = "${get_repo_root()}/global.hcl"
  expose = true # needs to be true to access the locals from global.hcl
}

terraform {
  source = "${get_repo_root()}/modules/wordpress-vm//."
}

dependency "base" {
  config_path = "${get_repo_root()}/01-base"
}

dependency "mysql-db" {
  config_path = "${get_repo_root()}/02-mysql-db"
}

inputs = {
  instances = include.global.locals.wordpress_instances
  subnet_cidr = dependency.base.outputs.default_subnet_cidr
}