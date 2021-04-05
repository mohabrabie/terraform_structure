resource "aws_key_pair" "deploye_key" {
  key_name   = "deploye-key"
  public_key = var.private_key
}