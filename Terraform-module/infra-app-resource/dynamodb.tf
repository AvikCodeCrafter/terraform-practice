module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = "${var.env}-dynamo-table"
  hash_key = "${var.hash_key}"

  attributes = [
    {
      name = var.hash_key
      type = "N"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "${var.env}-table"
  }
}