variable "region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "instance_count" {
  description = "The number of EC2 instances"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ec2_key_pair" {
  description = "The name of the EC2 key pair"
  type        = string
}

variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr_blocks" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

# variable "vault_token" {
#   description = "The token for the Vault cluster"
#   type        = string
#   sensitive   = true
#   default     = ""
# }

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "AWS Secret Access Key"
  sensitive   = true
}

variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "AWS Access Key ID"
  sensitive   = true
}
