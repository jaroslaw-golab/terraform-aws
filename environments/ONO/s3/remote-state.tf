terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "789543349485-terraform-state-bucket"
    key            = "devops/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
