output "instance_id_front_end" {
  value = module.front-end-dev.frontend_instance_ids
}

output "instance_id_back_end" {
  value = module.back-end-dev.backend_instance_ids
}

output "instance_id_nginx" {
  value = module.nginx_ec2-dev.nginx_instance_ids
}

output "instance_ip_back_end" {
  value = module.back-end-dev.backend_public_ips
}

output "instance_ip_front_end" {
  value = module.front-end-dev.frontend_public_ips
}

output "instance_ip_nginx" {
  value = module.nginx_ec2-dev.nginx_public_ips
}