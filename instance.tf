# terraform: EC2 instance

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "terraform_instance" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.terraform_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.terraform_sg.id]
  key_name                    = aws_key_pair.terraform_key.key_name
  associate_public_ip_address = true

  tags = {
    Name = "terraform-instance"
  }
}
