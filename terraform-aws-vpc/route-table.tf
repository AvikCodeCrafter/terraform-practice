# Public Subnet Route Table 

resource "aws_route_table" "hmrc_public_route_table" {
  vpc_id = aws_vpc.vpc-hmrc-us-east-1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_internet_gateway.id
  }
  tags = {
    Name = "Public Route Table: ${var.project}-${var.region}-RT"
  }
}

# Private Subnet Route Table 


resource "aws_route_table" "hmrc_private_route_table" {
  vpc_id = aws_vpc.vpc-hmrc-us-east-1.id
  count = length(var.cidr_private_subnet)
  depends_on = [ aws_nat_gateway.nat_gateway ]
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway[count.index].id
  }
  tags = {
    Name = "Private Route Table: ${var.project}-${var.region}-RT"
  }
}

