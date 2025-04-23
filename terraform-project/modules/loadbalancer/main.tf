
data "aws_ami" "imagem_ec2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_security_group" "grupo_b_nginx_sg" {
  vpc_id = var.vpc_id
  name   = "grupo_b_nginx_sg"
  tags = {
    Name = "grupo_b-nginx_sg"
  }
}

resource "aws_vpc_security_group_egress_rule" "grupo_b_egress_sg_rule" {
  security_group_id = aws_security_group.grupo_b_nginx_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "grupo_b_ingress_80_sg_rule" {
  security_group_id = aws_security_group.grupo_b_nginx_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}
resource "aws_vpc_security_group_ingress_rule" "grupo_b_ingress_22_sg_rule" {
  security_group_id = aws_security_group.grupo_b_nginx_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_network_interface" "grupo_b_nginx_ei" {
  subnet_id = var.pub_subnets_id[0]
  tags = {
    Name = "grupo_b_nginx_ei"
  }
}

resource "aws_instance" "grupo_b_nginx_ec2" {
  count                  = length(var.pub_subnets_id)
  instance_type          = "t3.micro"
  ami                    = data.aws_ami.imagem_ec2.id
  subnet_id              = var.pub_subnets_id[count.index]
  vpc_security_group_ids = [aws_security_group.grupo_b_nginx_sg.id]
  key_name = var.key_name

  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "grupo_b-nginx_ec2"
  }
}