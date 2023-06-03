terraform {
  source = "../../modules/mysql-db//."
}

include "global" {
  path   = "../../global.hcl"
  expose = true
}

dependency "base" {
  config_path = "../01-base"
}

inputs = {
  mysql_name          = include.global.locals.mysql_name
  db_subnet_id        = dependency.base.outputs.db_subnet_id
  private_dns_zone_id = dependency.base.outputs.private_dns_zone_id
  db_user             = include.global.locals.mysql_user
  db_pw               = include.global.locals.mysql_pw
}
