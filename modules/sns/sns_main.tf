module "sns" {
  source  = "terraform-aws-modules/sns/aws"
  version = "6.1.1"
  
  name = "${var.name}"

  subscriptions = {
    email = {
      protocol = "email"
      endpoint = "${var.endpoint}"
    }
  }
}