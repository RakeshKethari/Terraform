# terraform: Outputs

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.terraform_instance.public_ip
}

output "ssh_private_key_pem" {
  description = "Private key for SSH access (store securely!)"
  value       = tls_private_key.terraform_key.private_key_pem
  sensitive   = true
}

output "ssh_public_key_openssh" {
  description = "Public key (OpenSSH format)"
  value       = tls_private_key.terraform_key.public_key_openssh
}
