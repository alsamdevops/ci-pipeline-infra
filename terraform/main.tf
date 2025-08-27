resource "aws_instance" "frontend" {
  ami           = "ami-0a232144cf20a27a5"   # Amazon Linux 2 AMI (update with latest)
  instance_type = "t2.micro"
  tags = { Name = "c8.local" }
}

resource "aws_instance" "backend" {
  ami           = "ami-0bbdd8c17ed981ef9"   # Ubuntu 21.04 AMI (update with latest)
  instance_type = "t2.micro"
  tags = { Name = "u21.local" }
}

output "frontend_ip" {
  value = aws_instance.frontend.public_ip
}

output "backend_ip" {
  value = aws_instance.backend.public_ip
}

