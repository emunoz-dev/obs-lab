resource "aws_key_pair" "shh_tlkey" {
   key_name   = var.ec2_ssh_key_pair_name
   public_key = file("${path.module}/tl.pub")
}
