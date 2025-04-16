module "vpc-prod" {
  source         = "../../modules/vpc"
  project_name   = var.project_name
  project_region = var.project_region
}

module "nginx_ec2-prod" {
  source         = "../../modules/loadbalancer"
  project_name   = var.project_name
  project_region = var.project_region
  vpc_id         = module.vpc-prod.vpc_id
  pub_subnets_id = module.vpc-prod.pub_subnets_id
  
  depends_on = [ module.vpc-prod , module.front-end-prod]
}

module "front-end-prod" {
  source          = "../../modules/front-end"
  project_name    = var.project_name
  project_region  = var.project_region
  vpc_id          = module.vpc-prod.vpc_id
  priv_subnets_id = module.vpc-prod.priv_subnets_id
  
  depends_on = [module.vpc-prod , module.back-end-prod]
}

module "back-end-prod" {
  source          = "../../modules/back-end"
  project_name    = var.project_name
  project_region  = var.project_region
  vpc_id          = module.vpc-prod.vpc_id
  priv_subnets_id = module.vpc-prod.priv_subnets_id
  
  depends_on = [ module.vpc-prod ]
}
