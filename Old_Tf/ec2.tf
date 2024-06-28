//Simple Hello World Program


/*output "Hello1" {
  value = "Hello, ${var.varname}"
}
*/

//Creating IAM-Users and Groups using terraform and assign users to particular groups
/*
resource "aws_iam_user" "user1" {
  name = "Sahil"
}
resource "aws_iam_user" "user2" {
  name = "Local"
}
resource "aws_iam_group" "group1" {
  name = "dev"
}
resource "aws_iam_group" "group2" {
  name = "ops"
}

resource "aws_iam_user_group_membership" "demo" {
  user = aws_iam_user.user1.name
  groups = [
    aws_iam_group.group1.name
  ]
}

resource "aws_iam_user_group_membership" "demo1" {
  user = aws_iam_user.user2.name
  groups = [
    aws_iam_group.group2.name
  ]
}
*/

//Creating Key pairs using terraform

resource "aws_key_pair" "tf_key" {
  key_name   = "terraform-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD2u2zmBkN/C7U1JjuFsUgVZmDHfWCJgFJBL02GpprU6EpcIlbQEMAf7QW5v3qBcEE+sos1DrDaRJ5Xtewtcl8SaBUbkyka08WJpF9E2yHdzU8ZHGidSi65kf8VRZvgqQ+E5Zbzhlawa3xOXDfubp6RDmAPJaAKlOFOmYPSp0XIUyYmNSAl+7v8mThDgB6TrrSeqck3LkGoVjK3/DSHkeyng8Q02eBp5AYQGQGos7sA4Ds/YhJYFgPt9TDAmk7gLocjd2Bj2WTEAn+epYD+h978p+1Wc/LfwlBXoeJt06fApEIk7300YhRj9z9zzbZm3Lp7yCU5bW7YvUdzATDHGLiYnjUGu+pOtRgvD/CkwMQ5XpP2T8bsOg/tkNCyddSUDcexmW4pBn9l4lN90i3qtvs2YlauchZx9M2i9GaoW9z2vrPgQ/7qp/OtTvKXBDCbFZiKjxTGi52T9WPpbJwHmQeqxTyymaBeI6xqRGAPWwlLKdjmdBF+uY9NdL6hfXBaYUs= joker@chamankars"
  // public_key = file("${path.module}/id_rsa.pub")

}
output "keyname" {
  value = aws_key_pair.tf_key.key_name
}

//Creatimg Security Group....!
/*
resource "aws_security_group" "tfsg" {
 name = "tf-sg"
 description = "for terraform"

ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}*/

// Creating EC2 Instance...!

resource "aws_instance" "tf_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.tf_key.key_name
  //security_groups = "${aws_security_group.tfsg.*.name}"
}


 