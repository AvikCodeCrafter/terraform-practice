variable "region" {
    default = "us-east-1"
    type = string
}

variable "name" {
  default = "eks-cluster"
  type = string
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
    type = string
}

variable "azs" {
    default = ["us-east-1a", "us-east-1b"]
    type = list(string)
}

variable "private_subnets" {
    default = ["10.0.1.0/24", "10.0.2.0/24"]
    type = list(string)
}

variable "public_subnets" {
    default = ["10.0.101.0/24", "10.0.102.0/24"]
    type = list(string)
}

variable "intra_subnets" {
    default = ["10.0.5.0/24", "10.0.6.0/24"]
    type = list(string)
}

variable "env" {
    default = "prod"
    type = string
}

variable "eks_version" {
    default = "1.32"
    type = string
}

variable "instance_type" {
    default = ["t3.medium"]
    type = list(string)
  
}