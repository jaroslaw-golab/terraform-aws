resource "aws_vpc_endpoint" "S3" {
  vpc_id       = aws_vpc.prod-vpc.id
  service_name = "com.amazonaws.us-east-1.s3"
}
