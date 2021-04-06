resource "aws_key_pair" "deploye_key" {
  key_name   = "private-key"
  public_key = var.private_key
}