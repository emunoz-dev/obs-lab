variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = null
}

variable "vpc_cidr" {
  description = "Cidr of the vpc net"
  type        = string
  default     = null
}

variable "vpc_public_cidr" {
  description = "Public Cidr of public subnet"
  type        = string
  default     = null
}

variable "vpc_private_cidr" {
  description = "Private Cidr of public subnet"
  type        = string
  default     = null
}

variable "default_tags" {
  description = "map of key-values from terragrunt"
  type = map(string)
  default = null
}

variable "env" {
  description = "variable from general terragrunt common"
  type = string
  default = null
}