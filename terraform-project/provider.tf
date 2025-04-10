provider "aws" {
  region = var.project_region
}

terraform {
  backend "s3" {
    bucket = "grupo_b-terraform-state"
    key    = "terraform.tfstate"
    region = "us-west-1"
  }
}