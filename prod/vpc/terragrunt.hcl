## load terragrunt vars from parent folder
locals {
  parent_config = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}
#
include "base" {
    # load provider for terraform module
    path = find_in_parent_folders("../terragrunt.hcl")
}

# Specific vars for VPC terraform module
inputs = {
    #VPC
    # Use sintax loop to build string array with region + az
    availability_zones     = [for i in local.parent_config.locals.az : "${local.parent_config.locals.region}${i}"]
    env                    = "${local.parent_config.locals.env}"
    vpc_cidr               = "172.10.0.0/16"
    vpc_public_cidr        = "172.10.20.0/24"
    vpc_private_cidr       = "172.10.10.0/24"
}

terraform {
    #load the root directory of the terragrunt conf and seeking the directory of vpc terraform module
    source = "${get_parent_terragrunt_dir("base")}/modules/vpc"
}