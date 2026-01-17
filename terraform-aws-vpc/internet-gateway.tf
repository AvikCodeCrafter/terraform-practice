resource "aws_internet_gateway" "public_internet_gateway" {
  vpc_id = aws_vpc.vpc-hmrc-us-east-1.id

  tags = {
    Name = "IGW: ${var.project}-${var.region}-IGW"
  }
}

