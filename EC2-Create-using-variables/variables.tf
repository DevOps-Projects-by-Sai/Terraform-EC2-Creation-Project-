#In variables.tf, you will define the variables

variable "ami" {
    description = "It contains the ami id of the EC2"
}

variable "instance_type" {
    description = "It contains the instance type"
}

variable "key_name" {
    description = "It contains the key id of EC2 instance"
}

variable "subnet_id" {
    description = "It contains the subnet id"
  
}