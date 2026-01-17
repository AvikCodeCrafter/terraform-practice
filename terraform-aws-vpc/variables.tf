variable "region" {
  default = "us-east-1"
  description = "HMRC Project Region"
  type = string
}

variable "project" {
    default = "HMRC-Project"
    description = "Project Name"
    type = string
  
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
    description = "VPC CIDR Range"
    type = string 
}

variable "cidr_public_subnet" {
    default = ["10.0.1.0/24", "10.0.2.0/24"]
    description = "Public subnet CIDR Values"
    type = list(string)
}

variable "cidr_private_subnet" {
    default = ["10.0.3.0/24", "10.0.4.0/24"]
    description = "Private subnet CIDR Values"
    type = list(string)
}

variable "us_east_availability_zone" {
  default = ["us-east-1a", "us-east-1b"]
  description = "Availability Zones"
  type = list(string)
}