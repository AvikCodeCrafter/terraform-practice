terraform {
  backend "s3" {
    bucket = "my-tf-state-bucket-30051992"
    key = "terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}

terraform {
  backend "s3" {
    bucket = "tf-state-bucket-3015986454"
    key    = "terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
