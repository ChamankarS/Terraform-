resource "aws_instance" "vpc1_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  tags = {
    name="vpc1-public-instance"
  }
  subnet_id = aws_subnet.tf-vpc-public-1a.id 
  vpc_security_group_ids = [aws_security_group.tfsg.id]

  }

//Assign Elastic IP for our instance.....!
resource "aws_eip" "one"{
    instance = aws_instance.vpc1_instance.id   //Associate the elastic ip with our Instance......
}

//Assign SG for our instance......!

resource "aws_security_group" "tfsg" {
 name = "tf-sg"
 description = "for terraform"
 vpc_id  = aws_vpc.tf-VPC.id
  
ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}