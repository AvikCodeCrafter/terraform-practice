variable "env" {
    description = "This is the Infrastructure Environment"
    type = string
}

variable "s3_bucket" {
  description = "This is the s3 bucket name"
  type = string
}

variable "hash_key" {
    description = "This is the hash key for the dynamodb table"
    type = string
}

variable "instance_type" {
    description = "This is the instance type of the infra"
    type = string
}

variable "instance_count" {
    description = "This is the instance count"
    type = number
}

variable "ec2_ami_id" {
    description = "This is the ami id of the instance"
  
}