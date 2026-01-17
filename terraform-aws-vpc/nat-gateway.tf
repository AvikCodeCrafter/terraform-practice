resource "aws_nat_gateway" "nat_gateway" {
  count = length(var.cidr_private_subnet)  
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.hrmc_private_subnet[count.index].id
  tags = {
    Name = "Private NAT: ${var.project}-${var.region}-Private-NAT"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC or the Nat gateway
  depends_on = [aws_eip.nat_eip]
}


resource "aws_eip" "nat_eip" {
  count = length(var.cidr_private_subnet)
  domain   = "vpc"
}