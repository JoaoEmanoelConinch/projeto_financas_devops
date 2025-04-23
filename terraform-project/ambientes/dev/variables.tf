variable "project_region" {
  default = "us-west-1"
  type    = string
}


variable "project_name" {
  default = "grupo_b_dev"
  type    = string
}

variable "key_name" {
  description = "Nome da chave SSH para acessar instâncias backend"
  type        = string
}