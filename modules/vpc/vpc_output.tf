# Expose output for ec2_frontend
output "public_subnets" {
  value = module.vpc.public_subnets
}
