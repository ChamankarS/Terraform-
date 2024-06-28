resource "aws_internet_gateway" "vpc-igw" {
  vpc_id = aws_vpc.tf-VPC.id

  tags = {
    name="vpc internet gateway"
  }
}