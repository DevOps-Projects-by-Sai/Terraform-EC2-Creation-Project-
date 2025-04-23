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

resource "aws_instance" "example" {
    ami = "ami-0c1ac8a41498c1a9c"
    instance_type = "t3.micro"
    subnet_id = "subnet-0633fecf289de1d47"
    key_name = "windows-demo"
}