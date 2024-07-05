provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "sg1p" {
  name        = "SG1"
  description = "ICMP4 and SSH"

  ingress {
    from_port   = 8
    to_port     = 8
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg2p" {
  name        = "SG2"
  description = "SSH and Http"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "AMIN" {
  count             = 1
  availability_zone = "ap-south-1a"
  ami               = "ami-01376101673c89611"
  instance_type     = "t2.micro"
  key_name          = "lap01"

  tags = {
    Name = "Amazon Instance"
  }
}
