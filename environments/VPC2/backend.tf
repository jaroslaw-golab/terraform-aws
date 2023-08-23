terraform {
  backend "s3" {

    bucket         = "beaconcure-remote-state-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "beaconcure-remote-state"
    encrypt        = true
  }
}
