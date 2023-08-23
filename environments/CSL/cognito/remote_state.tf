terraform {
  backend "s3" {

    bucket         = "332278463693-terraform-state-bucket"
    key            = "dev/cognito/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
