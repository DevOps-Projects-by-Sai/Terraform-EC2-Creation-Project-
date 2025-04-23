resource "aws_s3_bucket" "s3_bucket" {
    bucket = "aravind-s3-bucket-xyz"
}

resource "aws_dynamodb_table" "dynamodb_table" {
    name = "terraform-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
}
