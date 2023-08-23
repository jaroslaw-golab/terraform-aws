resource "aws_ssm_parameter" "prod-private-subnet-1" {
  name  = "/vpc/private-subnet-1-id"
  type  = "String"
  value = aws_subnet.prod-subnet-private-1.id

}
resource "aws_ssm_parameter" "prod-private-subnet-2" {
  name  = "/vpc/private-subnet-2-id"
  type  = "String"
  value = aws_subnet.prod-subnet-private-2.id

}
resource "aws_ssm_parameter" "BatchSecurityGroup" {
  name  = "/vpc/sg/BatchSecurityGroupID"
  type  = "String"
  value = aws_security_group.BatchSecurityGroup.id

}

resource "aws_ssm_parameter" "AlbSecurityGroup" {
  name  = "/vpc/sg/AlbSecurityGroupID"
  type  = "String"
  value = aws_security_group.AlbSecurityGroup.id

}
resource "aws_ssm_parameter" "ApplicationSecurityGroup" {
  name  = "/vpc/sg/ApplicationSecurityGroupID"
  type  = "String"
  value = aws_security_group.application-security-group.id

}

resource "aws_ssm_parameter" "DatabaseSecurityGroup" {
  name  = "/vpc/sg/DatabaseSecurityGroupID"
  type  = "String"
  value = aws_security_group.database-security-group.id
}
