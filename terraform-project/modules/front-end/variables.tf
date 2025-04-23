variable "vpc_id" {
    description = "VPC ID"
    type        = string  
}
variable "project_name" {
    description = "Project name"
    type        = string
}
variable "project_region" {
    description = "Project region"
    type        = string
}

variable "pub_subnets_id" {
  description = "Lista de IDs das subnets públicas"
  type        = list(string)
}

variable "key_name" {
  description = "Nome da chave SSH para acessar instâncias backend"
  type        = string
}

variable "nginx_sg_id" {
  description = "ID do Security Group das instâncias NGINX (Load Balancer customizado)"
  type        = string
}
variable "backend_sg_id" {
  description = "ID do Security Group do backend"
  type        = string
}

output "frontend_ips" {
  value = aws_instance.grupo_b_front_ec2.*.public_ip
}