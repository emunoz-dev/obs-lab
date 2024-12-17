variable "ec2_frontend_nodes" {
  description = "Number of nodes to deploy frontend"
  type = number
  default = 0
}
variable "ec2_frontend_name" {
  description = "Name of the frontend instance to deploy"
  type = string
  default = null
}
variable "ec2_frontend_ami" {
  description = "Id of the ami to deploy frontend instances"
  type = string
  default = null
}
variable "ec2_frontend_instance_type" {
  description = "Type of the instances to deploy"
  type = string
  default = null
}

variable "default_tags" {
  description = "map of key-values from terragrunt"
  type = map(string)
  default = null
}

variable "public_subnets" {
  description = "List of public subnets id"
  type = list(string)
  default = [ null ]
}
