resource "aws_s3_bucket" "tf_state_backend" {
  bucket = "my-tf-state-bucket-30051992"
  tags = {
    Name        = "Terraform remote State File"
  }
}