data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "${var.instance_name}-sg"
  description = "Allow SSH only from approved CIDR"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH from approved CIDR"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.instance_name}-sg"
  }
}

resource "tls_private_key" "ec2_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated" {
  key_name   = "${var.instance_name}-key"
  public_key = tls_private_key.ec2_ssh.public_key_openssh

  tags = {
    Name = "${var.instance_name}-key"
  }
}

resource "vault_kv_secret_v2" "ec2_ssh_key" {
  mount = "secret"
  name  = "ec2/${var.instance_name}/ssh"

  data_json = jsonencode({
    key_name    = aws_key_pair.generated.key_name
    private_key = tls_private_key.ec2_ssh.private_key_pem
    public_key  = tls_private_key.ec2_ssh.public_key_openssh
  })
}

resource "aws_instance" "simple_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnets.default.ids[0]
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  key_name                    = aws_key_pair.generated.key_name
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}
