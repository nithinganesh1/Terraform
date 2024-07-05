provider "aws" {
  region = "ap-south-1"
}
resource "aws_vpc" "for_first" {
  cidr_block = "10.8.0.0/16"
  tags = {
    Name = "first_vpc"
  }
}

resource "aws_vpc" "for_second" {
  cidr_block = "10.7.0.0/16"
  tags = {
    Name = "second_vpc"
  }
}

resource "aws_subnet" "first_snet" {
  vpc_id            = aws_vpc.for_first.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.8.0.0/16"
  tags = {
    Name = "First_Snet"
  }
}
resource "aws_subnet" "second_snet" {
  vpc_id            = aws_vpc.for_second.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.7.0.0/16"
  tags = {
    Name = "Second_Snet"
  }
}
resource "aws_internet_gateway" "first_gtw" {
  vpc_id = aws_vpc.for_first.id

  tags = {
    Name = "GTW1"
  }
}
resource "aws_internet_gateway" "second_gtw" {
  vpc_id = aws_vpc.for_second.id

  tags = {
    Name = "GTW2"
  }
}
