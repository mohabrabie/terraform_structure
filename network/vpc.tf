resource "aws_vpc" "iti" {
  cidr_block = var.vpc_cider
  tags = {
      name = "iti"
  }
}