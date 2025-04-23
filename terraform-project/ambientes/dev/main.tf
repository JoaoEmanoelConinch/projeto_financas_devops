# Gera a chave privada RSA
resource "tls_private_key" "main_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "main_key_pair" {
  key_name   = "main-key"
  public_key = tls_private_key.main_ssh_key.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.main_ssh_key.private_key_pem
  filename        = "${path.module}/main-key.pem"
  file_permission = "0400"
}

module "vpc-dev" {
  source = "../../modules/vpc"
  project_name    = var.project_name
  project_region = var.project_region
}

module "front-end-dev" {
  source          = "../../modules/front-end"
  project_name    = var.project_name
  project_region  = var.project_region
  vpc_id          = module.vpc-dev.vpc_id
  pub_subnets_id  = module.vpc-dev.pub_subnets_id
  key_name = aws_key_pair.main_key_pair.key_name
  nginx_sg_id = module.nginx_ec2-dev.nginx_sg_id
  backend_sg_id   = module.back-end-dev.security_group_id
}

module "back-end-dev" {
  source          = "../../modules/back-end"
  project_name    = var.project_name
  project_region  = var.project_region
  vpc_id          = module.vpc-dev.vpc_id
  pub_subnets_id = module.vpc-dev.pub_subnets_id
  key_name = aws_key_pair.main_key_pair.key_name
  frontend_sg_id = module.front-end-dev.security_group_id
}

module "nginx_ec2-dev" {
  source         = "../../modules/loadbalancer"
  project_name   = var.project_name
  project_region = var.project_region
  vpc_id         = module.vpc-dev.vpc_id
  pub_subnets_id = module.vpc-dev.pub_subnets_id
  key_name = aws_key_pair.main_key_pair.key_name
}

resource "local_file" "ansible_inventory" {
  content = <<-EOT
    [frontend]
    ${module.front-end-dev.frontend_instance_ids[0]}
    ${module.front-end-dev.frontend_instance_ids[1]}

    [backend]
    ${module.back-end-dev.backend_instance_ids[0]}
    ${module.back-end-dev.backend_instance_ids[1]}

    [nginx]
    ${module.nginx_ec2-dev.nginx_instance_ids[0]}
    ${module.nginx_ec2-dev.nginx_instance_ids[1]}
  EOT

  filename = "${path.module}/inventory.ini"
}

data "template_file" "frontend_conf" {
  template = file("${path.module}/templates/frontend.conf.tmpl")

  vars = {
  frontend_ips = join(",", module.front-end-dev.frontend_ips)
  }
}

resource "local_file" "frontend_conf" {
  content  = data.template_file.frontend_conf.rendered
  filename = "${path.module}/../../../ansible/files/frontend.conf"
}