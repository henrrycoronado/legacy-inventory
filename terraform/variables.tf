variable "app_port" {
  description = "Puerto de la aplicacion de inventario"
  type        = number
  default     = 5000
}

variable "iam_profile_name" {
  description = "Nombre exacto del iam_instance_profile"
  type        = string
  default     = "LabRole" 
}