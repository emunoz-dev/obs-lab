# Create a log resource
module "log_group" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-group"
  version =  "3.3.0"

  name              = "obs-lab-logs"
  retention_in_days = 120
}