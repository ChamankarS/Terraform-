resource "aws_vpc" "tf-VPC" {
  cidr_block = var.cidr_vpc
  tags = {
    name = "terraform-vpc"
  }
}