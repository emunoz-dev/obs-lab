include "base" {
  # load provider
  path = find_in_parent_folders("../terragrunt.hcl")
}

dependency "logs" {
  config_path = "../logs"

  # How run the otput between modules
  # https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency
  mock_outputs_merge_strategy_with_state = "shallow"
  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan"]
  # require a fake output before will be available from terraform module
  mock_outputs = {
    log_group_name = "mock-fake-log-stream"
  }
}

terraform {
  #Load root directory of terragrunt and search the terraform module
  source = "${get_parent_terragrunt_dir("base")}/modules/log_stream"
}

inputs = {
  # input requiere for simple notification service to send email
  log_group_name = dependency.logs.outputs.cloudwatch_log_group_name
}