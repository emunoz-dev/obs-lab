module "ec2_frontend" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  #version = "2.15.0"
  version = "5.7.1"

  count = var.ec2_frontend_nodes

  key_name = var.ec2_ssh_key_pair_name


  name = "${var.ec2_frontend_name}-${count.index + 1}"
  ami = var.ec2_frontend_ami
  instance_type = var.ec2_frontend_instance_type
  subnet_id = var.public_subnets[count.index % length(var.public_subnets)]
  tags = merge(var.default_tags, { "service" = "frontend" }, {"Nginx" = "true"})
}
