output "vpc_id" {
  value = aws_vpc.prod-vpc.id
}

output "public_subnet_a_id" {
  value = aws_subnet.prod-subnet-public-1.id
}

output "public_subnet_b_id" {
  value = aws_subnet.prod-subnet-public-2.id
}

output "application_subnet_a_id" {
  value = aws_subnet.prod-subnet-private-1.id
}

output "application_subnet_b_id" {
  value = aws_subnet.prod-subnet-private-2.id
}

output "security_group_docker_builder" {
  value = aws_security_group.processing-security-group.id
}
output "security_group_application" {
  value = aws_security_group.application-security-group.id
  
}

resource "aws_ssm_parameter" "public-subnet-a-id" {
  type  = "String"
  name  = "/subnet/public-subnet-a-id"
  value = aws_subnet.prod-subnet-public-1.id

}


resource "aws_ssm_parameter" "public-subnet-b-id" {
  type  = "String"
  name  = "/subnet/public-subnet-b-id"
  value = aws_subnet.prod-subnet-public-2.id

}


resource "aws_ssm_parameter" "application_subnet_a_id" {
  type  = "String"
  name  = "/subnet/application_subnet_a_id"
  value = aws_subnet.prod-subnet-private-1.id

}
resource "aws_ssm_parameter" "application_subnet_b_id" {
  type  = "String"
  name  = "/subnet/application_subnet_b_id"
  value = aws_subnet.prod-subnet-private-2.id

}
resource "aws_ssm_parameter" "db_subnet_a_id" {
  type  = "String"
  name  = "/subnet/db-subnet-a-id"
  value = aws_subnet.db-subnet-private-1.id

}

resource "aws_ssm_parameter" "db_subnet_b_id" {
  type  = "String"
  name  = "/subnet/db-subnet-b-id"
  value = aws_subnet.db-subnet-private-2.id

}
resource "aws_ssm_parameter" "vpc_id" {
  type  = "String"
  name  = "/vpc/vpc-id"
  value = aws_vpc.prod-vpc.id

}
 