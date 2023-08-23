terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "115738711270-remote-state"
    key            = "devops/iam/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
