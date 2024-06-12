provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

}


resource "null_resource" "cluster" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
  }
}
