provider "aws" {
  region = "us-east-1"
  profile = "default"
}


locals {
  instance_name = "${terraform.workspace}-instance" 
}

variable "instance_type" {
 
}
resource "aws_instance" "ec2_example" {

    ami = "ami-04b70fa74e45c3917" 

    instance_type = var.instance_type

    tags = {
      Name = local.instance_name
    }
}
 
