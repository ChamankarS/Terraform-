resource "aws_route_table" "vpc1-route-table" {
  vpc_id = aws_vpc.tf-VPC.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-igw.id

  }

  tags = {
    name="ROute Table  for VPC 1"
  }
}