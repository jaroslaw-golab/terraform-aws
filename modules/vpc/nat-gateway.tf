resource "aws_eip" "prod-igw" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gateway" {

  allocation_id = aws_eip.prod-igw.id
  subnet_id     = aws_subnet.prod-subnet-public-1.id


  tags = merge(local.default_tags, {
    "Name" = "${var.project}-nat-gateway"
  })

  depends_on = [
    aws_internet_gateway.prod-igw
  ]
}
