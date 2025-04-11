module "vpc-dev" {
  source         = "../../modules/vpc"
  project_name   = var.project_name
  project_region = var.project_region
}

module "nginx_ec2-dev" {
  source         = "../../modules/loadbalancer"
  project_name   = var.project_name
  project_region = var.project_region
  vpc_id         = module.vpc-dev.vpc_id
  pub_subnets_id = module.vpc-dev.pub_subnets_id
  
  depends_on = [ module.vpc-dev , module.front-end-dev]
}

module "front-end-dev" {
  source          = "../../modules/front-end"
  project_name    = var.project_name
  project_region  = var.project_region
  vpc_id          = module.vpc-dev.vpc_id
  priv_subnets_id = module.vpc-dev.priv_subnets_id
  
  depends_on = [module.vpc-dev , module.back-end-dev]
}

module "back-end-dev" {
  source          = "../../modules/back-end"
  project_name    = var.project_name
  project_region  = var.project_region
  vpc_id          = module.vpc-dev.vpc_id
  priv_subnets_id = module.vpc-dev.priv_subnets_id
  
  depends_on = [ module.vpc-dev ]
}
