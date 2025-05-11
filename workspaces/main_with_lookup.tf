provider "aws" {
    region = "eu-north-1"
  
}

# Variables
# Lookup-variable ami_id with type of 'map'

variable "ami_id" {
  description = "ami id for ubuntu/linux"
  type = map(string)

  default = {
    "dev" = "ami-0c1ac8a41491a9c"      #ubuntu
    "stage" = "ami-0dd574ef87bac6c"    #linux
  }
}

variable "subnet_id" {
  description = "subent"
  default  = "subnet-0633fecf289dd47"
}

variable "instance_type" {
  description = "t3.micr"
  default  = "t3.micr"
}


# Importing Modules
module "ec2_instance" {
    source = "./modules/ec2_instance/"
    ami_id = lookup(var.ami_id, terraform.workspace, "ami-0c1ac8a41498c1a9c")
    instance_type = var.instance_type
    subnet_id = var.subnet_id
  
}
