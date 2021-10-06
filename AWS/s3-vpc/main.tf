terraform {
  backend "s3" {
    bucket = "kav123"
    key    = "s3-vpc"
    region = "us-east-2"
  }
}

provider "aws" {
  region     = "us-east-1"
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = "sample"
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnet_numbers
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.key
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
  tags = {
    Name        = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  for_each = var.private_subnet_numbers
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.key
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
  tags = {
    Name        = "private-subnet"

  }
}