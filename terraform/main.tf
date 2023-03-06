provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  count         = var.instance_count

  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "web"
  }

  security_groups = [aws_security_group.allow_ssh.id]
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow_ssh"
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

output "public_ip" {
  value = aws_instance.web.*.public_ip
}

output "ssh_command" {
  value = "ssh -i ${var.key_file} ubuntu@${element(aws_instance.web.*.public_ip, 0)}"
}
