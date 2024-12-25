include "base" {
  # load provider
  path = find_in_parent_folders("../terragrunt.hcl")
}

dependency "sns" {
  config_path = "../sns"

  # How run the otput between modules
  # https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency
  mock_outputs_merge_strategy_with_state = "shallow"
  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan"]
  # require a fake output before will be available from terraform module
  mock_outputs = {
    topic_arn = "arn:aws:sns:eu-west-1:835367859852:fake-arn"
  }
}

terraform {
  #Load root directory of terragrunt and search the terraform module
  source = "${get_parent_terragrunt_dir("base")}/modules/cloudwatch"
}

inputs = {
  # input requiere for simple notification service to send email
  topic_arn = dependency.sns.outputs.topic_arn

  #Custom vars for cloudwatch-metrics
  alarm_name = "CPU_high_85"
  alarm_description = "The CPU utilitzation is very high. >=85%"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = 85
}