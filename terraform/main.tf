module "vpc" {
    source = "./modules/vpc"
    project_name = var.project_name
    project_region = var.project_region
}
