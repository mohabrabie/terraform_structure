resource "aws_instance" "bastion" {
  ami           = var.ubuntu
  instance_type = var.machine_type
  subnet_id     = module.network.public1_id
  vpc_security_group_ids = [aws_security_group.public_security_group.id]
  key_name      = aws_key_pair.deploye_key.key_name
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> inventory"
  }
}

resource "aws_instance" "nginx" {
  ami           = var.ubuntu
  instance_type = var.machine_type
  subnet_id     = module.network.public1_id
  vpc_security_group_ids = [aws_security_group.private_security_group.id]
  key_name      = aws_key_pair.deploye_key.key_name
}