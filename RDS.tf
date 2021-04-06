resource "aws_db_instance" "mysql_db" {
  allocated_storage    = 5
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = "test"
  parameter_group_name = aws_db_parameter_group.p_group.name
  username             = "admin"
  password             = "12345678"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.RDS_private_security_group.id]
  db_subnet_group_name = aws_db_subnet_group.iti.name
  publicly_accessible = false
}