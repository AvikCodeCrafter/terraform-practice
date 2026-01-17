# dev infrastructure

module "dev-infra" {
  source = "./infra-app"
  env = "dev"
  bucket_name = "infra-app-bucket-301992"
  instance_count = 1
  instance_type = "t2.micro"
  ec2_ami_id = "ami-07ff62358b87c7116"
  hash_key = "studentID"
}

# staging infrastructure

module "staging-infra" {
  source = "./infra-app"
  env = "staging"
  bucket_name = "infra-app-bucket-301992"
  instance_count = 1
  instance_type = "t2.small"
  ec2_ami_id = "ami-07ff62358b87c7116"
  hash_key = "studentID"
}

# production infrastructure

module "productiondev-infra" {
  source = "./infra-app"
  env = "prod"
  bucket_name = "infra-app-bucket-301992"
  instance_count = 2
  instance_type = "t2.medium"
  ec2_ami_id = "ami-07ff62358b87c7116"
  hash_key = "studentID"
}

