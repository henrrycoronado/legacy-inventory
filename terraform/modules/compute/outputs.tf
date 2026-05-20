output "instance_public_ip" {
  description = "Direccion IP publica de la instancia EC2"
  value       = aws_instance.app_server.public_ip
}