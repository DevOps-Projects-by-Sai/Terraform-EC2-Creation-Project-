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
  ami                     = ""
  instance_type           = "t3.micro"
  subnet_id               = ""

}
