resource "aws_route_table_association" "pub_sub_asso" {
  subnet_id = aws_subnet.tf-vpc-public-1a.id
  route_table_id = aws_route_table.vpc1-route-table.id
}