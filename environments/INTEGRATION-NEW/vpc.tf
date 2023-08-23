module "vpc_main" {
  source  = "../../modules/vpc"
  project = var.project



  enable_dns_support   = true
  enable_dns_hostnames = true

  public-subnet-a-name = "public-subnet-a"
  public-subnet-b-name = "public-subnet-b"

  private-subnet-a-name = "private-subnet-a"
  private-subnet-b-name = "private-subnet-b"

  db-subnet-a-name = "db-subnet-a"
  db-subnet-b-name = "db-subnet-b"



  cidr_block           = "172.49.0.0/16"
  public-subnet-a-cidr = "172.49.0.0/19"
  public-subnet-b-cidr = "172.49.32.0/19"

  private-subnet-a-cidr = "172.49.64.0/19"
  private-subnet-b-cidr = "172.49.96.0/19"

  db-subnet-a-cidr = "172.49.128.0/19"
  db-subnet-b-cidr = "172.49.160.0/19"

  aws_vpn = "192.168.252.0/23"

  #peering to vpn - no need to change!!!
  client_vpn_endpoint_id     = "cvpn-endpoint-005c3e9c61a26eb8d"
  client_vpn_endpoint_subnet = "subnet-005ca4865e1018642"
  peer_vpc_id                = "vpc-0f71b027ef9fe96ed"
  peer_region                = "eu-west-1"
  accepter_rout_table_id     = "rtb-07067e0e60dab4602"

  #peering to builder
  peer_vpc_id_build            = "vpc-0dfaed41c9d08d7f0"
  peer_region_build            = "us-east-1"
  builder_vpc_cidr             = "172.16.0.0/16"
  accepter_rout_table_id_build = "rtb-059482f849652d1ce"
}


