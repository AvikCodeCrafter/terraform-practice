resource "aws_s3_bucket" "tf_state" {
  bucket = "tf-state-bucket-3015986454"
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "tf-state-bucket"
  }
}
resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}
