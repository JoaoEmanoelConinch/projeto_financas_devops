output "coninch_nginx_ec2_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.coninch_nginx.id
  
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.coninch_nginx_sg.id
}