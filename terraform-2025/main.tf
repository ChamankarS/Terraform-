provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ubuntu" {
  ami = "ami-00bb6a80f01f03502"
  instance_type = "t2.micro"

  tags = {
    Name = "Ubuntu Server"
  }
}
 