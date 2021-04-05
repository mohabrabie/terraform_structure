resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.public1_cider
  availability_zone = var.subnet_public1_AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "public1"
  }
}
resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.public2_cider
  availability_zone = var.subnet_public2_AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "public2"
  }
}
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.private1_cider
  availability_zone = var.subnet_private1_AZ
  tags = {
    Name = "private1"
  }
}
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.private2_cider
  availability_zone = var.subnet_private2_AZ
  tags = {
    Name = "private2"
  }
}