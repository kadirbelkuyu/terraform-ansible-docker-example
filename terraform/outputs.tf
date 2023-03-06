output "public_ip" {
  value = aws_instance.web.*.public_ip
}

output "ssh_command" {
  value = "ssh -i ${var.key_file} ubuntu@${element(aws_instance.web.*.public_ip, 0)}"
}
