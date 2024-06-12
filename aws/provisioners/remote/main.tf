provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}



resource "aws_instance" "provisioner-instance" {
  ami           = "ami-0778521d914d23bc1"
  instance_type = "t2.micro"
  key_name = "this-key-is-for-launch-template"
  tags = {
    Name = "remote-machine"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/ubuntu/this-key-is-for-launch-template.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "curl ifconfig.me",
      "whoami",
    ]
  }
}
