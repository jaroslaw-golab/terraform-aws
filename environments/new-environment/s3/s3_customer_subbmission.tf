data "aws_caller_identity" "current" {}

module "s3-customer-submission-prod" {
  source     = "../../../modules/s3/customer-data"
  account_id = data.aws_caller_identity.current.account_id

  stage = "prod"
}

module "s3-customer-submission-dev" {
  source = "../../../modules/s3/customer-data"

  account_id = data.aws_caller_identity.current.account_id
  stage      = "dev"
}

module "s3-customer-submission-sb" {
  source = "../../../modules/s3/customer-data"

  account_id = data.aws_caller_identity.current.account_id
  stage      = "sb"
}

module "s3-customer-submission-training" {
  source = "../../../modules/s3/customer-data"

  account_id = data.aws_caller_identity.current.account_id
  stage      = "tr"
}

module "s3-models-data" {
  source     = "../../../modules/s3/models-data"
  account_id = data.aws_caller_identity.current.id

}
