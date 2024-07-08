# Here we are going to ask hashicorp for the access and secret keys that are stored as variables in the workspace. We need to create a terraform block that houses the access key information
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.55.0"
    }
  }
  cloud {
    organization = "dsa_final_project"

    workspaces {
      name = "dsa-final-project"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

# I am unsure if the below vault code is needed - will test with team when they clone down to see if they can run a plan without it

# provider "vault" {
#   address     = "https://birmingham-dsa-cluster-public-vault-86e0f2b3.201d549e.z1.hashicorp.cloud:8200"
#   token       = var.vault_token
#   max_retries = 5
# }

# data "vault_generic_secret" "vault_secret_path" {
#   path = "finalproject/access"
# }

# output "vault_secrets" {
#   value     = data.vault_generic_secret.vault_secret_path.data
#   sensitive = true
# }

resource "aws_instance" "ec2_instance" {
  ami           = "ami-0fe310dde2a8fdc5c"
  instance_type = "t2.micro"
}

module "vpc" {
  source                     = "../modules/vpc" # Updated relative path
  region                     = var.region
  vpc_cidr_block             = var.vpc_cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
}

# module "security_groups" {
#   source = "../modules/security_groups" # Updated relative path
#   vpc_id = module.vpc.vpc_id
#   ec2_security_group_ingress = [
#     {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     },
#     {
#       from_port   = 80
#       to_port     = 80
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   ]
#   rds_security_group_ingress = [
#     {
#       from_port       = 3306
#       to_port         = 3306
#       protocol        = "tcp"
#       security_groups = [module.security_groups.ec2_security_group_id]
#     }
#   ]
#   elb_security_group_ingress = [
#     {
#       from_port   = 80
#       to_port     = 80
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   ]
# }

module "iam" {
  source                    = "../modules/iam" # Updated relative path
  ec2_role_name             = "ec2-role"
  ec2_instance_profile_name = "ec2-instance-profile"
  ec2_policy_name           = "ec2-policy"
  ec2_policy_document = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "s3:ListBucket",
          "s3:GetObject"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })
}

module "ec2" {
  source               = "../modules/ec2" # Updated relative path
  vpc_id               = module.vpc.vpc_id
  public_subnet1       = element(module.vpc.public_subnet_ids, 0)
  public_subnet2       = element(module.vpc.public_subnet_ids, 1)
  private_subnet1      = element(module.vpc.private_subnet_ids, 0)
  private_subnet2      = element(module.vpc.private_subnet_ids, 1)
  instance_count       = var.instance_count
  instance_type        = var.instance_type
  ec2_key_pair         = var.ec2_key_pair
  security_group_id    = module.security_groups.ec2_security_group_id
  iam_instance_profile = module.iam.ec2_instance_profile_name
}

module "rds" {
  source            = "../modules/rds" # Updated relative path
  vpc_id            = module.vpc.vpc_id
  private_subnet1   = element(module.vpc.private_subnet_ids, 0)
  private_subnet2   = element(module.vpc.private_subnet_ids, 1)
  db_username       = var.db_username
  db_password       = var.db_password
  security_group_id = module.security_groups.rds_security_group_id
}

module "alb" {
  source            = "../modules/alb" # Updated relative path
  vpc_id            = module.vpc.vpc_id
  public_subnet1    = element(module.vpc.public_subnet_ids, 0)
  public_subnet2    = element(module.vpc.public_subnet_ids, 1)
  instance_ids      = module.ec2.instance_ids
  security_group_id = module.security_groups.elb_security_group_id
}
