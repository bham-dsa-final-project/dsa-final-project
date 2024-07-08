variable "ec2_role_name" {
  description = "The name of the EC2 IAM role"
  type        = string
  default     = "ec2-role"
}

variable "ec2_instance_profile_name" {
  description = "The name of the EC2 instance profile"
  type        = string
  default     = "ec2-instance-profile"
}

variable "ec2_policy_name" {
  description = "The name of the EC2 policy"
  type        = string
  default     = "ec2-policy"
}

variable "ec2_policy_document" {
  description = "The policy document for the EC2 role"
  type        = string
}
