output "grupo_b_nginx_ec2_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.grupo_b_nginx_ec2
  
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.grupo_b_nginx_sg.id
}