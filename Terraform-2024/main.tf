provider "aws" {
  region = "us-east-1"
  profile = "default"
}


# Modules Creation
module "Web-Server-1" {
  source = ".//Tf_Module-1"
}

module "Web-Server-2" {
  source = ".//Tf_Module-2"
}

#User Creation

resource "aws_iam_user" "lb" {
  name = "user1"
   

  tags = {
    tag-key = "Paul"
  }
}

# VPC Creation
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "Http-VPC"
  }
}

#IGW Creation
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "vpc_igw"
  }
}
# Subnet Creation
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-subnet"
  }
}

# Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

#Subnet Association to route table
resource "aws_route_table_association" "public_rt_asso" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}


#Instance Creation
resource "aws_instance" "web" {  
  ami             = "ami-04b70fa74e45c3917" 
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_subnet.id
  user_data     =  "${file("apache.sh")}"

 # security_groups = [aws_security_group.sg.id]

#   user_data = <<-EOF
#   #!/bin/bash
#   echo "*** Installing apache2"
#   sudo apt update -y
#   sudo apt install apache2 -y
#   echo "*** Completed Installing apache2"
#   echo "Hello World" > /var/www/html/index.html
#   EOF

  tags = {
    Name = "terraform_instance"
  }
}
