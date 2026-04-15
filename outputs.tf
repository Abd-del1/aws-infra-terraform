output "instance_id" {
  description = "EC2 instance ID"
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
