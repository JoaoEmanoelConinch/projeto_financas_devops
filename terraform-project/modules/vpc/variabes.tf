variable "project_region" {
  type = string
}


variable "project_name" {
  type = string
}

variable "vpc_cidr_block" {
  type    = string
  default = "172.30.0.0/16"
}

variable "pub_subnets" {
  type = map(object({
    subnet_name  = string
    subnet_Unity = string
    subnet_az    = string
  }))
  default = {
    subnet_pub_a = {
      subnet_name  = "subnet_pub_a"
      subnet_Unity = "vpc"
      subnet_az    = "c"
    }
    subnet_pub_b = {
      subnet_name  = "subnet_pub_b"
      subnet_Unity = "vpc"
      subnet_az    = "b"
    }
  }
}

variable "priv_subnets" {
  type = map(object({
    subnet_name  = string
    subnet_Unity = string
    subnet_az    = string
  }))
  default = {
    subnet_priv_a = {
      subnet_name  = "subnet_priv_a"
      subnet_Unity = "vpc"
      subnet_az    = "c"
    }
    subnet_priv_b = {
      subnet_name  = "subnet_priv_b"
      subnet_Unity = "vpc"
      subnet_az    = "b"
    }
  }
}
