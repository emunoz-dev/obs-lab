include "base" {
  # load provider
  path = find_in_parent_folders("../terragrunt.hcl")
}

terraform {
  #Load root directory of terragrunt and search the terraform module
  source = "${get_parent_terragrunt_dir("base")}/modules/logs"
}
