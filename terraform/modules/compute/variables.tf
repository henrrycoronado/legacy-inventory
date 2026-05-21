variable "ami_id" {
  description = "ID de la AMI de Amazon Linux 2023 en us-east-1"
  type        = string
  default     = "ami-0c101f26f147fa7fd"
}

variable "instance_type" {
  description = "Tipo de instancia"
  type        = string
  default     = "t3.micro"
}

variable "security_group_id" {
  description = "ID del Security Group creado en el modulo network"
  type        = string
}

variable "iam_profile_name" {
  description = "Nombre del perfil IAM asignado por Learner Lab"
  type        = string
}

variable "app_port" {
  description = "Puerto de la aplicacion para configurarlo en el entorno"
  type        = number
}