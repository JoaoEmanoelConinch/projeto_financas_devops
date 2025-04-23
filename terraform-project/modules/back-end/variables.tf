variable "vpc_id" {
    description = "VPC ID"
    type        = string  
}
variable "project_name" {
    description = "Project name"
    type        = string
}
variable "project_region" {
    description = "Project region"
    type        = string
}

variable "pub_subnets_id" {
    type = list(string)
}

variable "key_name" {
  description = "Nome da chave SSH para acessar instâncias backend"
  type        = string
}

variable "frontend_sg_id" {
  description = "ID do Security Group do front-end"
  type        = string
  default     = null
}