resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_group_project.id

  tags = {
    Name = "internet_gateway"
  }
}