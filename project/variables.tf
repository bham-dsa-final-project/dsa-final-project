variable "region" {
  description = "The region where AWS resources will be created"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr_blocks" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidr_blocks" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "ec2_key_pair" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "db_username" {
  description = "Username for RDS instance"
  type        = string
}

variable "db_password" {
  description = "Password for RDS instance"
  type        = string
  sensitive   = true
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
}

variable "ec2_security_group_ingress" {
  description = "Ingress rules for EC2 security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "rds_security_group_ingress" {
  description = "Ingress rules for RDS security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "elb_security_group_ingress" {
  description = "Ingress rules for ELB security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
