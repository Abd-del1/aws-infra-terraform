variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "simple-ec2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c02fb55956c7d316"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the EC2 instance"
  type        = string
}

variable "vault_addr" {
  description = "Vault server address"
  type        = string
  default     = "http://184.73.22.166:8200"
}

variable "vault_token" {
  description = "Vault token used by Terraform to write generated SSH key into Vault"
  type        = string
  sensitive   = true
}
