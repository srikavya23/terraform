terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.12.29"
}

provider "aws" {
  shared_credentials_file = "/root/.aws/credentials"
  profile                 = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0eb5f3f64b10d3e0e"
  instance_type = "t2.micro"

  tags = {
    Name = "sample2"
  }
}
