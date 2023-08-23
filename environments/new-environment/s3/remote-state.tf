terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "${data.aws_caller_identity.current.id}-remote-state"
    key            = "devops/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
