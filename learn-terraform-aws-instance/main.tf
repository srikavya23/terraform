terraform {
  backend "remote" {
    organization = "zelarsoftprivatelimited"

    workspaces {
      name = "sample"
    }
  }
}
required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">=0.14.29"
}
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0eb5f3f64b10d3e0e"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
