locals {
  parent_config = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

include "base" {
  # load provider
  path = find_in_parent_folders("../terragrunt.hcl")
}

# Create first vpc module
dependency "vpc" {
  config_path = "../vpc"

  # How run the otput between modules
  # https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency
  mock_outputs_merge_strategy_with_state = "shallow"
  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan"]
  # require a fake output before will be available from terraform module
  mock_outputs = {
    public_subnets = ["fake-subnets"]
  }
}

terraform {
  #Load root directory of terragrunt and searh the terraform module
  source = "${get_parent_terragrunt_dir("base")}/modules/ec2_frontend"
}

inputs = {
    # Specific vars for ec2 terraform module
    #Ssh key
    ec2_ssh_key_pair_name = "ssh_tl"

    #FrontEnd
    ec2_frontend_nodes         = 1
    ec2_frontend_name          = "nginx"
    ec2_frontend_ami           = "ami-0dad359ff462124ca" # Ubuntu 20.04
    ec2_frontend_instance_type = "t2.micro"
    #Terragrunt will create a new terraform var with output from vpc terraform module
    public_subnets = dependency.vpc.outputs.public_subnets
}