module "log_stream" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-stream"
  version = "3.3.0"

  name           = "stream-log"
  log_group_name = "${var.log_group_name}"
}