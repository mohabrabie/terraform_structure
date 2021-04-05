resource "aws_security_group" "public_security_group" {
  name        = "public"
  description = "Allow traffic to move throug"
  vpc_id      = module.network.vpc_id

    ingress {
    description = "to web"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  tags = {
    Name = "public"
  }
}


resource "aws_security_group" "private_security_group" {
  name        = "private"
  description = "Allow ssh connection"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "ssh from my machince"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cider]
  }
    ingress {
    description = "to web"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cider]
    }
  tags = {
    Name = "private"
  }
}