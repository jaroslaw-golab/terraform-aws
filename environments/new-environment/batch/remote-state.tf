terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "integration-state-bucket"
    key            = "devops/batch/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
