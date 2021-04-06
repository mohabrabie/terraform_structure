resource "aws_db_subnet_group" "iti" {
  name       = "main"
  subnet_ids = [module.network.public2_id, module.network.public1_id, module.network.private1_id]

  tags = {
    Name = "My DB subnet group"
  }
}