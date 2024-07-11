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
  db_subnet_id = dependency.base.outputs.private_dns_zone_id
  private_dns_zone_id = dependency.base.outputs.db_subnet_id
  mysql_name = "mysql"
  db_user = "test"
  db_pw = "verYs4fEP4ssw0rd"
}