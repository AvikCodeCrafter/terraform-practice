variable "instance_type" {
    default = "t2.micro"
    type = string
}

variable "root_storage_size" {
    default = 15
    type = number
}

variable "ec2_ami_id" {
    default = "ami-07ff62358b87c7116"
    type = string
  
}

variable "aws_region" {
    default = "us-east-1"
  
}

variable "env" {
    default = "prod"
}
