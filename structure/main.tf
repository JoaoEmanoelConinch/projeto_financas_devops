resource "aws_s3_bucket" "terraform_state" {
    bucket = "vinicius-terraform-state"
    acl = "private"
    force_destroy = true
    versioning {
        enabled = false
    }
}