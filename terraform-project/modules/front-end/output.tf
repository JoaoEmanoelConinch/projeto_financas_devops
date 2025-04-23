output "frontend_instance_ids" {
  description = "IDs das instâncias EC2 do frontend"
  value       = aws_instance.grupo_b_front_ec2[*].id
}

output "frontend_private_ips" {
  description = "Private IPs das instâncias frontend"
  value       = aws_instance.grupo_b_front_ec2[*].private_ip
}

output "frontend_public_ips" {
  description = "Public IPs das instâncias frontend"
  value       = aws_instance.grupo_b_front_ec2[*].public_ip
}

output "security_group_id" {
  value = aws_security_group.grupo_b_front_sg.id
}