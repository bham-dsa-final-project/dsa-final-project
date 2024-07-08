variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "The list of subnet IDs in different Availability Zones"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID"
  type        = string
}

variable "instance_ids" {
  description = "The list of EC2 instance IDs"
  type        = list(string)
}
