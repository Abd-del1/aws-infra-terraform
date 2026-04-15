aws_region       = "us-east-1"
instance_name    = "simple-ec2"
instance_type    = "t2.micro"
ami_id           = "ami-0c02fb55956c7d316"

# Your public IP (only you can SSH)
allowed_ssh_cidr = "223.185.47.60/32"

# Your Vault server
vault_addr       = "http://184.73.22.166:8200"
