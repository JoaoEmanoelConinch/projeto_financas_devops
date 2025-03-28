module "vpc" {
    source = "./modules/vpc"
    project_name = var.project_name
    project_region = var.project_region
}

module "nginx_ec2" {
    source = "./modules/loadbalancer"
    project_name = var.project_name
    project_region = var.project_region
    vpc_id = module.vpc.vpc_id
    subnet_pub_a_id = module.vpc.subnet_pub_a_id
    subnet_pub_b_id = module.vpc.subnet_pub_b_id
}