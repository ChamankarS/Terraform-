resource "aws_subnet" "tf-vpc-public-1a" {
  vpc_id     = aws_vpc.tf-VPC.id
  cidr_block = var.cidr_pubsub
}