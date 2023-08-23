locals {
  default_tags = {
    user      = data.aws_caller_identity.current.arn
    Terraform = true
  }
}
