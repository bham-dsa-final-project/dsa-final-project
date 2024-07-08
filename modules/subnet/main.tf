resource "aws_subnet" "group_work_public_subnet" {
  count = var.subnet_count["public"]
  vpc_id = aws_vpc.vpc_group_project.id
  cidr_block = var.public_subnet_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.group_subnet.names[count.index]

  tags = {
    Name = "group_work_public_subnet_${count.index}"
  }
}

resource "aws_subnet" "group_work_private_subnet" {
  count = var.subnet_count["private"]
  vpc_id = aws_vpc.vpc_group_project.id
  cidr_block = var.private_subnet_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.group_subnet.names[count.index]

  tags = {
    Name = "group_work_private_subnet_${count.index}"
  }
}
