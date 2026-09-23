module "network" {
  source = "../../modules/network"

  environment           = "dev"
  vpc_cidr              = "10.0.0.0/16"
  public_subnet_1_cidr  = "10.0.1.0/24"
  public_subnet_2_cidr  = "10.0.2.0/24"
  private_subnet_1_cidr = "10.0.11.0/24"
  private_subnet_2_cidr = "10.0.12.0/24"

  az_1 = "ap-south-1a"
  az_2 = "ap-south-1b"
}

module "ecs" {
  source = "../../modules/ecs"

  environment = "dev"

  vpc_id             = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
  private_subnet_ids = module.network.private_subnet_ids

  container_image = "nginx:latest"
  container_port  = 80
}

module "rds" {

  source = "../../modules/rds"

  environment = "dev"

  vpc_id                = module.network.vpc_id
  private_subnet_ids    = module.network.private_subnet_ids
  ecs_security_group_id = module.ecs.ecs_security_group_id

  db_name     = "appdb"
  db_username = "admin"
  db_password = "Tripare123!"

  instance_class          = "db.t3.micro"
  backup_retention_period = 1
  deletion_protection     = false
}
