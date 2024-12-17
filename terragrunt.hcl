locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  region  = local.common_vars.locals.region
  profile = local.common_vars.locals.profile
}



# Changed endpoints toward localstack container
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  required_providers {
    aws ={
      source  = "hashicorp/aws"
      version = "~> 3.74.0"
    }
  }
}
provider "aws" {
  #profile = "${local.profile}" #profile not works
  region  = "${local.region}"

  # localstackconfig
  # s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  
  endpoints {
    # https://docs.localstack.cloud/references/external-ports/
    #s3     = "http://localstack:4566"
    ec2    = "http://localstack:4566"
  }
}
EOF
}
/*
# Disable the resource S3. There is error about accepting fake credentials and blocks module execution.
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config  = {
    access_key                  = "test"
    secret_key                  = "test"
    bucket  = "terraform-state-tl-tests"
    key     = "terraform-state-candidate/terraform.tfstate"
    region  = local.region
    profile = local.profile
    encrypt = true

    ##localstackconfig
    force_path_style            = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    #endpoint = "http://localstack:4572" # https://docs.localstack.cloud/references/external-ports/
    endpoint = "http://localstack:4566"
  }
}

generate "common_variables" {
  path      = "${path_relative_from_include()}/common_variables.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF

variable "env" {
  type    = string
  default = null
}

variable "default_tags" {
  type    = map
  default = null
}
EOF
}
*/
