output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.simple_ec2.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.simple_ec2.public_ip
}

output "private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.simple_ec2.private_ip
}

output "generated_key_name" {
  description = "Generated AWS key pair name"
  value       = aws_key_pair.generated.key_name
}

output "vault_ssh_secret_path" {
  description = "Vault path where generated SSH keys are stored"
  value       = "secret/ec2/${var.instance_name}/ssh"
}
