data "aws_caller_identity" "current" {}


module "create_remote_state_bucket" {
  source              = "../../../modules/s3/remote_state_bucket"
  region              = "us-east-1"
  bucket              = "223845951885-terraform-state-bucket"
  dynamodb_table_name = "terraform-state-lock"
}
