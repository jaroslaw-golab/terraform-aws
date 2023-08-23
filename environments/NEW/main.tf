module "vpc_main" {
  source  = "../../modules/vpc"
  project = "devops-terraform-sandbox"



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

  #peering to vpn
  client_vpn_endpoint_id     = "cvpn-endpoint-00a82cf4ee23057e4"
  client_vpn_endpoint_subnet = "subnet-09685993e96f30113"
  peer_vpc_id                = "vpc-09834ceb2ff07e108"
  peer_region                = "us-east-1"
  accepter_rout_table_id     = "rtb-036c57e3ccd080c34"
  #peering to builder
  //peer_vpc_id_build = "vpc-0dfaed41c9d08d7f0"
  //peer_region_build = "us-east-1"
  //builder_vpc_cidr  = "172.16.0.0/16"
}

output "application_subnet_a_id" {
  value = module.vpc_main.application_subnet_a_id
}

data "aws_ssm_parameter" "application_subnet_a_id" {
  name = "/subnet/application_subnet_a_id"

}
data "aws_ssm_parameter" "application_sg" {
  name = "/vpc/sg/ApplicationSecurityGroupID"
}
module "verify-prod-a" {
  source  = "../../modules/ec2"
  project = "devops-terraform-sandbox"
  # instance_name = "Verify-${var.project}-prod-a-ubuntu-22"
  image         = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name      = "twoje-sandbox"
  region        = "us-east-1"
  stage         = "prod"

  subnet_id      = data.aws_ssm_parameter.application_subnet_a_id.value
  security_group = data.aws_ssm_parameter.application_sg.value
}

