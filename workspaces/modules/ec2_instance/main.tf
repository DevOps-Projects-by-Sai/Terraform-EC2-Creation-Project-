provider "aws" {
    region = "eu-north-1"
  
}


variable "ami_id" {
    description = "This value contains ami_id"
  
}

variable "instance_type" {
    description = "This value contains instance type"
  
}

variable "subnet_id" {
  description = "This value consists subnet id"
}

resource "aws_instance" "example" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
  
}