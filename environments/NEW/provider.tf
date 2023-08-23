terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


provider "aws" {
  alias   = "peer"
  profile = "devops-path"
  region  = "us-east-1"
  shared_credentials_files = [
    "~/.aws/credentials"
  ]
  # Accepter's credentials.
}
