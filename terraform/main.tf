provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "c8" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type = "t2.micro"
  key_name      = "your-keypair"
  tags = {
    Name = "c8.local"
  }
}

resource "aws_instance" "u21" {
  ami           = "ami-06b21ccaeff8cd686" # Ubuntu 21.04
  instance_type = "t2.micro"
  key_name      = "your-keypair"
  tags = {
    Name = "u21.local"
  }
}

output "ansible_inventory" {
  value = <<EOT
[frontend]
c8.local ansible_host=${aws_instance.c8.public_ip} ansible_user=ec2-user ansible_python_interpreter=/usr/bin/python3

[backend]
u21.local ansible_host=${aws_instance.u21.public_ip} ansible_user=ubuntu ansible_python_interpreter=/usr/bin/python3
EOT
}

