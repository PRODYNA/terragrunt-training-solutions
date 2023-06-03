terraform {
  source = "../../modules/mysql-db//."
}

include "global" {
  path   = "../../global.hcl"
  expose = true
}