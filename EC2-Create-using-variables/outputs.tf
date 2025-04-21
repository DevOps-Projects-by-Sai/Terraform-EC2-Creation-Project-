output "public_ip" {
  description = "It prints the public ip of EC2 instance after creating"
  value = aws_instance.example.public_ip
}
