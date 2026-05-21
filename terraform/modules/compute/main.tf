resource "aws_instance" "app_server" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_profile_name

  vpc_security_group_ids = [var.security_group_id]
  user_data_replace_on_change = true

  user_data = <<-EOF
              #!/bin/bash
              # Actualizacion forzada para recuperar la aplicacion
              yum update -y
              yum install -y git nodejs npm

              git clone https://github.com/henrrycoronado/legacy-inventory.git /home/ec2-user/app
              
              cd /home/ec2-user/app
              npm install

              export PORT=${var.app_port}
              nohup npm start > /home/ec2-user/app/app.log 2>&1 &
              EOF

  tags = {
    Name = "LegacyInventory-Server"
  }
}