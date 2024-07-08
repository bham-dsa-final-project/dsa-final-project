resource "aws_security_group" "elb" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.elb_security_group_ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = {
    Name = "elb-sg"
  }
}

resource "aws_security_group" "ec2" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ec2_security_group_ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = {
    Name = "ec2-sg"
  }
}

resource "aws_security_group" "rds" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.rds_security_group_ingress
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = ingress.value.security_groups
    }
  }

  tags = {
    Name = "rds-sg"
  }
}
