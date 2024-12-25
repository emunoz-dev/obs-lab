variable "topic_arn" {
  description = "The ARN of the SNS topic, as a more obvious property (clone of id)"
  type        = string
  default     = null
}

variable "alarm_name" {
  description = "Name of alarm"
  type = string
  default = null
}

variable "alarm_description" {
  description = "description of alarm"
  type = string
  default = null
}

variable "comparison_operator" {
  description = "operator used to metric evaluation"
  type = string
  default = null
}

variable "threshold" {
  description = "limit number to trigger"
  type = number
  default = null
}
