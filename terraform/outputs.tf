output "inventory" {
  value = templatefile("${path.module}/../ansible/inventory.tpl", {
    frontend_ip = aws_instance.frontend.public_ip
    backend_ip  = aws_instance.backend.public_ip
  })
}

