resource "aws_instance" "demo" {
  ami = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  key_name = "devops"
  tags = {Name:"Terra_Nigga"}
}

output "public_ip" {
  value = aws_instance.demo.public_ip
  description = "Public IP"
}