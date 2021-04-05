resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.iti.id

  tags = {
    Name = "gw"
  }
}