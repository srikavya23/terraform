provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "/root/.aws/credentials"
  profile                 = "default"
}
resource "aws_instance" "sample" {
  ami          = "ami-0eb5f3f64b10d3e0e"
  instance_type = "t2.micro"
  tags = {
    Name = "sample1"
  }
}
