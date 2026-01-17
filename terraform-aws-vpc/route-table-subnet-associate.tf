# RT-Public Subnet Assocation

resource "aws_route_table_association" "public_subnet_association" {
  count = length(var.cidr_public_subnet)
  subnet_id      = element(aws_subnet.hrmc_public_subnet[*].id, count.index)
  route_table_id = aws_route_table.hmrc_public_route_table.id
  depends_on = [ aws_subnet.hrmc_public_subnet, aws_route_table.hmrc_public_route_table ]
}

# RT-Private Subnet Assocation

resource "aws_route_table_association" "private_subnet_association" {
  count = length(var.cidr_private_subnet)
  subnet_id      = element(aws_subnet.hrmc_private_subnet[*].id, count.index)
  route_table_id = aws_route_table.hmrc_private_route_table[count.index].id
  depends_on = [ aws_subnet.hrmc_private_subnet, aws_route_table.hmrc_private_route_table ]
}