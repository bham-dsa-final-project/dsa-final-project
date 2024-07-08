resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_group_project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id  # Specify .id to refer to the resource ID
  }
}

resource "aws_route_table_association" "public" {
  count          = var.subnet_count.public
  route_table_id = aws_route_table.public_route_table.id  # Specify .id to refer to the resource ID

  subnet_id = aws_subnet.group_work_subnet[count.index].id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc_group_project.id

  route {
    cidr_block = "0.0.0.0/0"
    # Optionally, for private subnets, you might route traffic to a NAT gateway instead of an internet gateway
    # gateway_id = aws_nat_gateway.nat.id
  }
}

resource "aws_route_table_association" "private" {
  count          = var.subnet_count.private
  route_table_id = aws_route_table.private_route_table.id  # Specify .id to refer to the resource ID

  subnet_id = aws_subnet.group_work_subnet[count.index].id
}



