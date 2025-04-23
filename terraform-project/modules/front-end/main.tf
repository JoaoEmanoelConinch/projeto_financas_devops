data "aws_ami" "imagem_ec2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_security_group" "grupo_b_front_sg" {
  name   = "grupo_b_front_sg"
  vpc_id = var.vpc_id

  # Permite acesso publico HTTP
  ingress {
    description = "Acesso HTTP Publico"  # Removido acento
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Permite acesso HTTPS se necessario
  ingress {
    description = "Acesso HTTPS Publico"  # Removido acento
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Mantem a regra do Load Balancer
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.nginx_sg_id]
    description     = "Acesso do Load Balancer"  # Esta já está correta
  }

  # Mantem a regra SSH
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "grupo_b_front_ec2" {
  associate_public_ip_address = true
  count         = length(var.pub_subnets_id)
  ami           = data.aws_ami.imagem_ec2.id
  instance_type = "t2.medium"
  subnet_id     = var.pub_subnets_id[count.index]
  key_name = var.key_name
  security_groups = [aws_security_group.grupo_b_front_sg.id]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "grupo_b_front_ec2"
  }
}