# Create VPC for us-east-1 region with the CIDR Block [10.0.0.0/16]

resource "aws_vpc" "vpc-hmrc-us-east-1" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "VPC: ${var.project}-${var.region}"
  }
}