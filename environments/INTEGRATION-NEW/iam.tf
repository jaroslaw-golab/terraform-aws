data "aws_caller_identity" "current" {}

module "iam_roles" {
  source = "../../modules/iam"
  account_id = data.aws_caller_identity.current.id
}