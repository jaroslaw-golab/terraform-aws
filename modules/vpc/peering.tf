data "aws_caller_identity" "peer" {
  provider = aws.peer
}
data "aws_caller_identity" "peer_builder" {
  provider = aws.peer_builder
}

resource "aws_vpc_peering_connection" "peering" {
  peer_owner_id = data.aws_caller_identity.peer.account_id
  peer_vpc_id   = var.peer_vpc_id
  vpc_id        = aws_vpc.prod-vpc.id
  peer_region   = var.peer_region
  auto_accept   = false

  tags = merge(local.default_tags, {
    "Side" = "Accepter",
    "Name" = "${var.project}-to-vpn"
  })
}
resource "aws_vpc_peering_connection_accepter" "peering" {
  provider                  = aws.peer
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  auto_accept               = true


  tags = merge(local.default_tags, {
    "Side" = "Accepter",
    "Name" = "VPN-to-${var.project}"
  })

}
resource "aws_route" "route_requester" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = var.aws_vpn
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id

}

resource "aws_route" "route_accepter" {
  provider                  = aws.peer
  route_table_id            = var.accepter_rout_table_id
  destination_cidr_block    = var.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peering.id
}

resource "aws_ec2_client_vpn_route" "vpn_client_route" {
  provider               = aws.peer
  client_vpn_endpoint_id = var.client_vpn_endpoint_id
  destination_cidr_block = var.cidr_block
  target_vpc_subnet_id   = var.client_vpn_endpoint_subnet
  description            = "vpn-to-${var.project}"
}

#### peereng between current vpc and vpc2 (builder)

resource "aws_vpc_peering_connection" "builder" {
  peer_owner_id = data.aws_caller_identity.peer.account_id
  peer_vpc_id   = var.peer_vpc_id_build
  vpc_id        = aws_vpc.prod-vpc.id
  peer_region   = var.peer_region_build
  auto_accept   = false

  tags = merge(local.default_tags, {
    "Side" = "Requester",
    "Name" = "${var.project}-to-build"
  })
}

resource "aws_vpc_peering_connection_accepter" "builder" {
  provider                  = aws.peer_builder
  vpc_peering_connection_id = aws_vpc_peering_connection.builder.id
  auto_accept               = true


  tags = merge(local.default_tags, {
    "Side" = "Accepter",
    "Name" = "build-to-${var.project}"
  })
}

resource "aws_route" "route_requester_builder" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = var.builder_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.builder.id

}

resource "aws_route" "route_accepter_builder" {
  provider                  = aws.peer_builder
  route_table_id            = var.accepter_rout_table_id_build
  destination_cidr_block    = var.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.builder.id
}


output "peering_requester" {
  value = aws_vpc_peering_connection.peering.id
}
output "peering_accepter" {
  value = aws_vpc_peering_connection_accepter.peering.id
}

