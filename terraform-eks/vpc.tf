module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.name}-${var.env}-vpc"
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  intra_subnets   = var.intra_subnets

  enable_nat_gateway = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true
  enable_vpn_gateway = false


  tags = {
    Terraform = "true"
    Environment = var.env
  }
}