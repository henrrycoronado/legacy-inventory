output "public_ip" {
  description = "IP publica para acceder a la aplicacion"
  value       = module.compute.instance_public_ip
}