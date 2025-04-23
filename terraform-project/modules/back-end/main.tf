data "aws_ami" "imagem_ec2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_security_group" "grupo_b_back_sg" {
  name        = "grupo_b_back_sg"
  description = "Security Group do Back-end"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Acesso front-end"
    from_port        = 3000             
    to_port          = 3000
    protocol         = "tcp"
    security_groups = [var.frontend_sg_id]
  }

  ingress {
    description = "SSH para debug (remover em prod)"
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

  tags = {
    Name = "grupo_b_back_sg"
  }
}

resource "aws_instance" "grupo_b_back_ec2" {
  associate_public_ip_address = true
  count         = length(var.pub_subnets_id)
  ami           = data.aws_ami.imagem_ec2.id
  instance_type = "t2.micro"
  subnet_id     = var.pub_subnets_id[count.index]
  vpc_security_group_ids = [aws_security_group.grupo_b_back_sg.id]
  key_name = var.key_name

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "grupo_b_back_ec2"
  }
}
