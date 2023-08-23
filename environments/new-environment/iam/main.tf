data "aws_caller_identity" "current" {}

module "iam" {
  source     = "../../../modules/iam"
  account_id = data.aws_caller_identity.current.account_id
}

