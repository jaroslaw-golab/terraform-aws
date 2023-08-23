terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "223845951885-terraform-state-bucket"
    key            = "devops/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
