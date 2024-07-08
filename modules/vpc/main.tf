# resource "aws_vpc" "main" {
#   cidr_block = var.vpc_cidr_block

#   tags = {
#     Name = "main-vpc"
#   }
# }

# resource "aws_subnet" "public" {
#   count      = length(var.public_subnet_cidr_blocks)
#   vpc_id     = aws_vpc.main.id
#   cidr_block = element(var.public_subnet_cidr_blocks, count.index)

#   tags = {
#     Name = "public-subnet-${count.index}"
#   }
# }

# resource "aws_subnet" "private" {
#   count      = length(var.private_subnet_cidr_blocks)
#   vpc_id     = aws_vpc.main.id
#   cidr_block = element(var.private_subnet_cidr_blocks, count.index)

#   tags = {
#     Name = "private-subnet-${count.index}"
#   }
# }

# resource "aws_internet_gateway" "main" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "main-igw"
#   }
# }

# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.main.id
#   }

#   tags = {
#     Name = "public-rt"
#   }
# }

# resource "aws_route_table_association" "public" {
#   count          = length(aws_subnet.public)
#   subnet_id      = element(aws_subnet.public[*].id, count.index)
#   route_table_id = aws_route_table.public.id
# }


resource "aws_vpc" "vpc_group_project" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "vpc_group_project"
  }
}
