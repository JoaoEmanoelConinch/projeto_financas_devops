provider "aws" {
  region = var.project_region
}

terraform {
  backend "s3" {
    bucket = "grupo-b-terraform-state"
    key    = "devlopment/terraform.tfstate"
    region = "us-west-1"
  }
}