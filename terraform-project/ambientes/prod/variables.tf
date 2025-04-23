variable "project_region" {
  default = "us-west-2"
  type    = string
}


variable "project_name" {
  default = "grupo_b_prod"
  type    = string
}

variable "key_name" {
  description = "Nome da chave SSH para acessar instâncias backend"
  type        = string
}