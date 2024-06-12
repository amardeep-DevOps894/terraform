provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

}



resource "aws_instance" "resource-one" {
  ami           = "ami-0778521d914d23bc1"
  instance_type = "t2.micro"
  count = length(var.my_list)
  tags = {
   Name = "server-${count.index}"
}

}


variable "my_list" {
  default = ["zero", "first", "second", "third", "fourth"]

}
