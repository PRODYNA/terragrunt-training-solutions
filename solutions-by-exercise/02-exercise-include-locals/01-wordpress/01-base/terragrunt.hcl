terraform {
  source = "../../modules/base//."
}

include "global" {
  path   = "../../global.hcl"
  expose = true
}