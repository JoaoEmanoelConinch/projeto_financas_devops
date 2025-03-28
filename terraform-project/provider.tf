provider "aws" {
    region = var.project_region
}

terraform {
    backend "s3" {
        bucket = "coninch-terraform-state"
        key    = "terraform.tfstate"
        region = "us-west-1"
    }
}