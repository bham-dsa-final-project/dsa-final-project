provider "aws" {
  region = var.region
}

module "vpc" {
  source                     = "../modules/vpc"
  region                     = var.region
  vpc_cidr_block             = var.vpc_cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  availability_zones         = var.availability_zones
  name_prefix                = var.name_prefix
}

module "security_groups" {
  source                     = "../modules/security_groups"
  vpc_id                     = module.vpc.vpc_id
  ec2_security_group_ingress = var.ec2_security_group_ingress
  rds_security_group_ingress = var.rds_security_group_ingress
  elb_security_group_ingress = var.elb_security_group_ingress
}

module "ec2" {
  source               = "../modules/ec2"
  vpc_id               = module.vpc.vpc_id
  public_subnet1       = module.vpc.public_subnet_ids[0]
  public_subnet2       = module.vpc.public_subnet_ids[1]
  private_subnet1      = module.vpc.private_subnet_ids[0]
  private_subnet2      = module.vpc.private_subnet_ids[1]
  instance_count       = var.instance_count
  instance_type        = var.instance_type
  ec2_key_pair         = var.ec2_key_pair
  security_group_id    = module.security_groups.ec2_security_group_id
  iam_instance_profile = var.iam_instance_profile
}

module "rds" {
  source            = "../modules/rds"
  vpc_id            = module.vpc.vpc_id
  private_subnet1   = module.vpc.private_subnet_ids[0]
  private_subnet2   = module.vpc.private_subnet_ids[1]
  db_username       = var.db_username
  db_password       = var.db_password
  security_group_id = module.security_groups.rds_security_group_id
}

module "alb" {
  source            = "../modules/alb"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.public_subnet_ids
  instance_ids      = module.ec2.instance_ids
  security_group_id = module.security_groups.elb_security_group_id
}
