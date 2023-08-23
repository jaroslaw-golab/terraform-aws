terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

  }
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias   = "vpc2"
  profile = "VPC2"
  region  = "us-east-1"
  shared_credentials_files = [
    "~/.aws/credentials"
  ]
}
