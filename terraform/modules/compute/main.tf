resource "aws_instance" "app_server" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_profile_name

  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              # Actualizar paquetes e instalar dependencias con YUM
              yum update -y
              yum install -y git nodejs npm

              # Clonar el repositorio (Reemplaza con el enlace a TU fork)
              git clone https://github.com/henrrycoronado/legacy-inventory.git /home/ec2-user/app
              
              # Ingresar a la carpeta de la app e instalar dependencias de Node
              cd /home/ec2-user/app
              npm install

              # Configurar el puerto y ejecutar la aplicacion en segundo plano
              export PORT=${var.app_port}
              nohup npm start > /home/ec2-user/app/app.log 2>&1 &
              EOF

  tags = {
    Name = "LegacyInventory-Server"
  }
}