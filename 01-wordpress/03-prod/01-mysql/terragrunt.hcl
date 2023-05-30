include "global" {
  path   = "${get_repo_root()}/global.hcl"
  expose = true # needs to be true to access the locals from global.hcl
}

terraform {
  source = "${get_repo_root()}/modules/mysql-db//."
}

dependency "governance" {
  config_path = "${get_repo_root()}/01-base"
}

inputs = {
  resource_group_name = dependency.base.outputs.resource_group_name
  db_subnet_cidr      = dependency.base.outputs.db_subnet_cidr
}