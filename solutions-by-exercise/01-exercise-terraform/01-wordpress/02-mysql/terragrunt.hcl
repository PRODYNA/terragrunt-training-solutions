terraform {
  source = "../../modules/mysql-db//."
}

dependency "base" {
  config_path = "../01-base"
  skip_outputs = true
}
