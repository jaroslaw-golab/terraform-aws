terraform {
  backend "s3" {
    bucket         = "759180416712-terraform-state-bucket"
    key            = "dev/sg/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
