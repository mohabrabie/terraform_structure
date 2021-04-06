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

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
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
    cidr_blocks = ["0.0.0.0/0"] #module.network.vpc_cider
    }
    ingress {
    description = "to web"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
  tags = {
    Name = "private"
  }
}

resource "aws_security_group" "RDS_private_security_group" {
  name        = "RDS"
  description = "allow app to connect to RDS"
  vpc_id      = module.network.vpc_id

    ingress {
    description = "from web"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cider]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
  tags = {
    Name = "RDS"
  }
}
resource "aws_security_group" "radis_private_security_group" {
  name        = "radis"
  description = "allow app to connect to radis"
  vpc_id      = module.network.vpc_id

    ingress {
    description = "from web to radis"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cider]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
  tags = {
    Name = "radis"
  }
}



