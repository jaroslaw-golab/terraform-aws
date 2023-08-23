terraform {
  backend "s3" {
    profile        = "janssen"
    bucket         = "789543349485-terraform-state-bucket"
    key            = "dev/cognito/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
