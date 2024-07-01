resource "aws_instance" "app_server" {
  count           = var.instance_count
  ami             = "ami-05d929ac8893c382f" #Amazon Linux 2023 AMI - t2.micro
  instance_type   = var.instance_type
  key_name        = var.ec2_key_pair
  security_groups = [var.security_group_id]
  subnet_id       = element([var.private_subnet1, var.private_subnet2], count.index % 2)

  tags = {
    Name = "AppServer-${count.index}"
  }

  iam_instance_profile = var.iam_instance_profile
  user_data            = file("user_data.sh")
}
