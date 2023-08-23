terraform {
  backend "s3" {

    bucket         = "integration-state-bucket"
    key            = "integration/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "integration-state"
    encrypt        = true
  }
}
