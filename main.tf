terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "this" {
  ami                     = "ami-0c1ac8a41498c1a9c"
  instance_type           = "t3.micro"
  subnet_id               = "subnet-0633fecf289de1d47"

}