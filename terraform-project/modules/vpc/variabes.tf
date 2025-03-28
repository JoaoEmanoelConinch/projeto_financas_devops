variable "project_region" {
    type = string
}


variable "project_name" {
    type=string
}

variable "vpc_cidr_block"{
    type=string
    default="172.30.0.0/16"
}

# variable "subnets" {
#   type = map(object({
#     subnet_id = string
#   }))
#   default = {
#     subnet_pub_a = {
#       subnet_id = aws_subnet.subnet_pub_a.id
#     }
#     subnet_pub_b = {
#       subnet_id = aws_subnet.subnet_pub_b.id
#     }
#     subnet_priv_a = {
#       subnet_id = aws_subnet.subnet_priv_a.id
#     }
#     subnet_priv_b = {
#       subnet_id = aws_subnet.subnet_priv_b.id
#     }
#   }
#}