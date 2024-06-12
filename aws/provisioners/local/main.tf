provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}



resource "aws_instance" "provisioner-instance" {
  ami           = "ami-0778521d914d23bc1"
  instance_type = "t2.micro"
  tags = {
    Name = "remote-machine"
  }
  provisioner "local-exec" {
    command = "echo `curl ifconfig.me` > myip.txt"
  }

}
