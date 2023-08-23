

variable "aws_region" {
  default = "us-east-1"
}

variable "region" {
  default = "eu-west-1"
}

variable "enable_dns_support" {
  default = "true"

}

variable "enable_dns_hostnames" {
  default = "true"

}
variable "project" {}

variable "cidr_block" {}

variable "public-subnet-a-name" {}

variable "public-subnet-b-name" {}

variable "private-subnet-a-name" {}

variable "private-subnet-b-name" {}

variable "db-subnet-a-name" {}

variable "db-subnet-b-name" {}

variable "aws_vpn" {}

variable "public-subnet-a-cidr" {}

variable "public-subnet-b-cidr" {}

variable "private-subnet-a-cidr" {}

variable "private-subnet-b-cidr" {}

variable "db-subnet-a-cidr" {}

variable "db-subnet-b-cidr" {}

variable "MongoDbPort" {
  default = "27017"
}
variable "DatabasePort" {
  default = "5432"
}
variable "client_vpn_endpoint_id" {}
variable "client_vpn_endpoint_subnet" {}

variable "peer_vpc_id" {}
variable "accepter_rout_table_id" {}
variable "peer_vpc_id_build" {}
variable "peer_region" {}
variable "peer_region_build" {}
variable "builder_vpc_cidr" {}
variable "accepter_rout_table_id_build" {}






