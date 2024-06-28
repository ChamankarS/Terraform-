variable "cidr_vpc" {
  type        = string
  description = "cidr block for our first vpc"
  default     = "10.0.0.0/16"
}

variable "cidr_pubsub" {
  type        = string
  default     = "10.0.1.0/24"
  description = "subnet for our vpc"
}

variable "ami_id" {
  type = string
  description = "The AMI to use for the vpc1-instance "
  default = "ami-080e1f13689e07408"
}
variable "instance_type" {
  type = string
  description = "The instance type to use for the vpc1-instance "
  default = "t2.micro"
}