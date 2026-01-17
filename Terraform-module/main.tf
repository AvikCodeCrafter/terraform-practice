module "dev-infra-app" {
    source = "./infra-app-resource"
    env = "dev"
    s3_bucket = "hmrc-bucket"
    hash_key = "studentID"
    instance_count = 1
    instance_type = "t3.small"
    ec2_ami_id = "ami-07ff62358b87c7116"
}