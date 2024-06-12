provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

}



resource "aws_instance" "resource-one" {
  ami           = "ami-0778521d914d23bc1"
  instance_type = "t2.micro"
  tags = {
    Name = var.name
}

}


variable "name" {
  type = string
}

