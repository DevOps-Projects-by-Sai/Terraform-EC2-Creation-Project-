provider "aws" {
    region = "eu-north-1"
  
}


resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sub1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "eu-north-1a"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "sub2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "eu-north-1b"
    map_public_ip_on_launch = true
  
}

resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "rt1" {
    vpc_id = aws_vpc.myvpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ig.id
    }  
}

resource "aws_route_table" "rt2" {
    vpc_id = aws_vpc.myvpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ig.id
    }  
}

resource "aws_route_table_association" "rt_assoc1" {
    subnet_id = aws_subnet.sub1.id
    route_table_id = aws_route_table.rt1.id
}

resource "aws_route_table_association" "rt_assoc2" {
    subnet_id = aws_subnet.sub2.id
    route_table_id = aws_route_table.rt2.id
}



resource "aws_security_group" "sg" {
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg"
  }
}


resource "aws_instance" "ec2_ins1" {
    ami = "ami-0c1ac8a41498c1a9c"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.sub1.id
    vpc_security_group_ids = [aws_security_group.sg.id]
  
}


resource "aws_instance" "ec2_ins2" {
    ami = "ami-0c1ac8a41498c1a9c"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.sub2.id
    vpc_security_group_ids = [aws_security_group.sg.id]
  
}



resource "aws_s3_bucket" "bucket" {
  bucket = "cloudchampec2bucket007"
}