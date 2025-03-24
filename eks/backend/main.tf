provider "aws" {
  region  = "ap-south-1"
}


resource "aws_s3_bucket" "example" {
  bucket = "demo-terraform-eks-state-buck"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "terraform-eks-state-locks"
  billing_mode   = "PAYPERREQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}