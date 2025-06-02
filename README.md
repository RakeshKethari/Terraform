# Terraform

# terraform: AWS EC2 with VPC, SSH, and Security Group

This Terraform project provisions the following on AWS:

- A new VPC and public subnet (customizable)
- An internet gateway for public internet access
- A security group allowing SSH (port 22) access
- A secure SSH key pair (private key output for your use)
- A Free Tier-eligible EC2 instance (Amazon Linux 2, t2.micro) with public IP

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) v1.0+
- AWS CLI configured with credentials and permissions to create resources

## Usage

1. **Clone the repository & enter its directory:**
    ```sh
    git clone https://github.com/RakeshKethari/Terraform.git
    cd Terraform
    ```

2. **Initialize Terraform:**
    ```sh
    terraform init
    ```

3. **Preview the changes:**
    ```sh
    terraform plan
    ```

4. **Apply the configuration:**
    ```sh
    terraform apply
    ```
    Confirm when prompted.

5. **Retrieve outputs:**
    - The public IP of the EC2 instance.
    - The SSH private key (store this securely, do not commit it to version control).

## Connecting to Your EC2 Instance

1. Save the private key output to a file, e.g. `terraform-key.pem`:
    ```sh
    echo "<paste the value of ssh_private_key_pem here>" > terraform-key.pem
    chmod 600 terraform-key.pem
    ```

2. Connect via SSH:
    ```sh
    ssh -i terraform-key.pem ec2-user@<instance_public_ip>
    ```

## Variables

- `aws_region`: AWS region to deploy resources (default: us-east-1)
- `vpc_cidr`: VPC CIDR block (default: 10.0.0.0/16)
- `public_subnet_cidr`: Subnet CIDR (default: 10.0.1.0/24)
- `instance_type`: EC2 instance type (default: t2.micro)
- `ssh_ingress_cidr`: Allowed CIDR for SSH access (default: 0.0.0.0/0)

You can override variables using `-var` or via a `terraform.tfvars` file.

## Security

- **Do not share or commit the private key output to version control.**
- Change `ssh_ingress_cidr` in `variables.tf` if you want to restrict SSH access to specific IPs.

## State File

- The Terraform state file (`terraform.tfstate`) is stored locally by default.
- **Never commit your state file or backup files to version control.**

## Cleanup

To remove all resources, run:
```sh
terraform destroy
```

## License

MIT
