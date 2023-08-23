data "aws_caller_identity" "current" {}

data "aws_kms_key" "customer_submission_bucket" {
    key_id = "arn:aws:kms:us-east-1:931929721969:key/858ffdbe-bbe3-4755-9bea-68c78b67e55e"
}
module "s3-customer-submission-sb" {
  source     = "../../../modules/s3/customer-data"
  account_id = data.aws_caller_identity.current.account_id

  environment = "sb"
  kms = data.aws_kms_key.customer_submission_bucket.arn
}

module "s3-customer-submission-tr" {
  source     = "../../../modules/s3/customer-data"
  account_id = data.aws_caller_identity.current.account_id

  environment = "training"
  kms = data.aws_kms_key.customer_submission_bucket.arn
}
