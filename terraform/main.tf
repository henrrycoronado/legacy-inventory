module "network" {
  source   = "./modules/network"
  app_port = var.app_port
}

module "compute" {
  source            = "./modules/compute"
  security_group_id = module.network.security_group_id
  iam_profile_name  = var.iam_profile_name
  app_port          = var.app_port
}