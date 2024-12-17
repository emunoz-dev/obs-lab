locals {
  common_vars = read_terragrunt_config("common.hcl")
}


#Begin read and load terragrunt modules
dependencies {
  paths = ["${path_relative_to_include()}/ec2_frontend"]
}


inputs = {
  # General variables for terraform modules
  default_tags = {
    Project     = "pruebas_sistemas"
    Environment = "${local.common_vars.locals.env}"
    Terraform   = "true"
  }

  env = "${local.common_vars.locals.env}"
}

