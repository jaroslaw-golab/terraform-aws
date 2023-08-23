provider "aws" {
  region = var.aws_region
}

provider "aws" {
  alias   = "peer"
  profile = "VPC2"
  region  = "eu-west-1"
  shared_credentials_files = [
    "~/.aws/credentials"
  ]
  # Accepter's credentials.
}
provider "aws" {
  alias   = "peer_builder"
  profile = "VPC2"
  region  = "us-east-1"
  shared_credentials_files = [
    "~/.aws/credentials"
  ]
  # Accepter's credentials.
}
