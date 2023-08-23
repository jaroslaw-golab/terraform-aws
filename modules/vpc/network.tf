resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = merge(local.default_tags, {
    "Name" = var.project
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.prod-vpc.id

  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod-igw.id

  }

  tags = merge(local.default_tags, {
    "Name" = "${var.project}-public"
  })
}

resource "aws_route_table_association" "prod-crta-public-subnet-1" {
  subnet_id      = aws_subnet.prod-subnet-public-1.id
  route_table_id = aws_route_table.public.id

}

resource "aws_route_table_association" "prod-crta-public-subnet-2" {
  subnet_id      = aws_subnet.prod-subnet-public-2.id
  route_table_id = aws_route_table.public.id

}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.prod-vpc.id


  tags = merge(local.default_tags, {
    "Name" = "${var.project}-private"
  })
}

resource "aws_route_table_association" "prod-crta-private-subnet-1" {
  subnet_id      = aws_subnet.prod-subnet-private-1.id
  route_table_id = aws_route_table.private.id

}

resource "aws_route_table_association" "prod-crta-private-subnet-2" {
  subnet_id      = aws_subnet.prod-subnet-private-2.id
  route_table_id = aws_route_table.private.id

}

resource "aws_route_table_association" "db-crta-private-subnet-1" {
  subnet_id      = aws_subnet.db-subnet-private-1.id
  route_table_id = aws_route_table.private.id

}

resource "aws_route_table_association" "db-crta-private-subnet-2" {
  subnet_id      = aws_subnet.db-subnet-private-2.id
  route_table_id = aws_route_table.private.id

}
