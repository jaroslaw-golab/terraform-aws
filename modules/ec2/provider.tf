provider "aws" {
  region = var.region
}
provider "aws" {
  alias   = "vpc2"
  profile = "VPC2"
  region  = "us-east-1"
  shared_credentials_files = [
    "~/.aws/credentials"
  ]
}