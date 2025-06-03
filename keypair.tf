# terraform: SSH key pair generation

resource "tls_private_key" "terraform_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-key"
  public_key = tls_private_key.terraform_key.public_key_openssh
}