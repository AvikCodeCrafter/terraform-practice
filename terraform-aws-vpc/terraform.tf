terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.28.0"
    }
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
