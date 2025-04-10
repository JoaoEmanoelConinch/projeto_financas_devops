data "aws_ami" "imagem_ec2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}
resource "aws_security_group" "grupo_b_back_sg" {
  vpc_id = var.vpc_id
  name   = "grupo_b_back_sg"
  tags = {
    Name = "grupo_b-back_sg"
  }
}

resource "aws_instance" "grupo_b_back_ec2" {
  count         = length(var.priv_subnets_id)
  ami           = data.aws_ami.imagem_ec2.id
  instance_type = "t2.micro"
  subnet_id     = var.priv_subnets_id[count.index]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "grupo_b_back_ec2"
  }
}
