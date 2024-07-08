resource "aws_db_instance" "main" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0.25"      # Use a supported MySQL version
  instance_class         = "db.t3.micro" # Use a supported instance class
  identifier             = "mydb-instance"
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.mysql8.0"
  multi_az               = false
  publicly_accessible    = false
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.main.name

  tags = {
    Name = "mydb-instance"
  }
}





resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = [var.private_subnet1, var.private_subnet2]

  tags = {
    Name = "main"
  }
}
