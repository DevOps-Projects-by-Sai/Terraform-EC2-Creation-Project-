terraform {
  backend "s3" {
    bucket = "aravind-s3-bucket-xyz"
    region = "eu-north-1"
    dynamodb_table = "terraform-lock"
    key = "aravind/terraform.tfstate"
  }
}