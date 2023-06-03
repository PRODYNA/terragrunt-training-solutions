terraform {
  source = "../../modules/wordpress-vm//."
}

include "global" {
  path   = "../../global.hcl"
  expose = true
}