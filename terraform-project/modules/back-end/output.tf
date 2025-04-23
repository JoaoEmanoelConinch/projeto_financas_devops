output "backend_instance_ids" {
  description = "IDs das instâncias EC2 do backend"
  value       = aws_instance.grupo_b_back_ec2[*].id
}

output "backend_private_ips" {
  description = "Private IPs das instâncias backend"
  value       = aws_instance.grupo_b_back_ec2[*].private_ip
}

output "backend_public_ips" {
  description = "Public IPs das instâncias backend"
  value       = aws_instance.grupo_b_back_ec2[*].public_ip
}

output "security_group_id" {
  value = aws_security_group.grupo_b_back_sg.id
}