provider "aws" {
    region = "eu-north-1"  
}

# Variables
# Here variables were defined, the values for variables were defined in dev/stage.tfvars
# You need to apply by using 'terraform apply -var-file=dev.tfvars' 

variable "ami_id" {
  description = "ami id for ubuntu/linux"
}

variable "subnet_id" {
  description = "subent id"
}

variable "instance_type" {
  description = "instance type macro/micro"
}


# Importing Modules
module "ec2_instance" {
    source = "./modules/ec2_instance/"
    ami_id = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
  
}
