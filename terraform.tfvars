# terraform: Sample tfvars file for customizing your deployment

aws_region         = "us-east-1"       # AWS region
vpc_cidr           = "10.0.0.0/16"     # VPC CIDR block
public_subnet_cidr = "10.0.1.0/24"     # Public subnet CIDR block
instance_type      = "t2.micro"        # EC2 instance type (Free Tier eligible)
ssh_ingress_cidr   = "0.0.0.0/0"       # Allowed CIDR for SSH access (change for better security)
