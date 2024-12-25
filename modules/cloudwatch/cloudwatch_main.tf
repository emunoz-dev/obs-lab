
module "cloudwatch_ec2-cpu-alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version = "3.3.0"

  alarm_name          = "${var.alarm_name}"
  alarm_description   = "${var.alarm_description}"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods  = 1
  threshold           = var.threshold
  period              = 60
  unit                = "Percent"

  namespace   = "AWS/EC2"
  metric_name = "CPUUtilization"
  statistic   = "Maximum"

  alarm_actions = ["${var.topic_arn}"]
  
  
  #https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html
}