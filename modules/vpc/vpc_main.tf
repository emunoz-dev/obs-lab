module "vpc" {
 source = "terraform-aws-modules/vpc/aws"
 #version = "3.12.0"
 version = "5.17.0"
 name                 = "vpc-${var.env}"
 cidr                 = var.vpc_cidr
 enable_dns_hostnames = "true"


 azs = var.availability_zones
 public_subnets  = [var.vpc_public_cidr]
 private_subnets = [var.vpc_private_cidr]

 igw_tags = merge(var.default_tags, { "Service" = "igw" })
 tags = merge(var.default_tags, { "service" = "vpc" })
}
