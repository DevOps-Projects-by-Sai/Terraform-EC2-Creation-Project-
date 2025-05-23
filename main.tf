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


module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami = "ami-0c1ac8a41498c1a9"
  instance_type = "t3.micr"
  key_name = "windows-de"
  subnet_id = "subnet-0633fecf289de1"
}