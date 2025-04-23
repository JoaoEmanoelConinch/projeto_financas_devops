output "nginx_sg_id" {
  value = aws_security_group.grupo_b_nginx_sg.id
}

# Outputs para o Load Balancer (NGINX)
output "nginx_public_ips" {
  value = aws_instance.grupo_b_nginx_ec2[*].public_ip
}

output "nginx_private_ips" {
  value = aws_instance.grupo_b_nginx_ec2[*].private_ip
}

output "nginx_instance_ids" {
  value = aws_instance.grupo_b_nginx_ec2[*].id
}