# Setup Public Subnet

resource "aws_subnet" "hrmc_public_subnet" {
  vpc_id     = aws_vpc.vpc-hmrc-us-east-1.id
  count =  length(var.cidr_public_subnet)
  cidr_block = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.us_east_availability_zone, count.index)
  #map_customer_owned_ip_on_launch = true

  tags = {
    Name = "Subnet-Public: ${var.project}-Public Subnet ${count.index + 1}"
  }
}


# Setup Private subnet

resource "aws_subnet" "hrmc_private_subnet" {
  vpc_id     = aws_vpc.vpc-hmrc-us-east-1.id
  count = length(var.cidr_private_subnet)
  cidr_block = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.us_east_availability_zone, count.index)

  tags = {
    Name = "Subnet-Private: ${var.project}-Private Subnet ${count.index + 1}"
  }
}