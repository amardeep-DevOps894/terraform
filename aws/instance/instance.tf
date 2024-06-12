terraform {
  required_providers {
    aws = {
      version = "~> 4.0"
    }
  }
}



provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "first-instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "this-key-is-for-launch-template"
  count         = 3
  tags = {
    Name        = "First-Instance-from-Terraform"
    Environment = "Reserach and Developemnt Area"
    Department  = "DevOps"
  }
}



variable "ami" {
  default = "ami-0778521d914d23bc1"
}


variable "instance_type" {
  default = "t2.micro"

}



