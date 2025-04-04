data "aws_ami" "imagem_ec2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_security_group" "coninch_front_sg" {
  vpc_id = var.vpc_id
  name   = "coninch_front_sg"
  tags = {
    Name = "coninch-front_sg"
  }
}

resource "aws_instance" "coninch_front_ec2" {
  count = length(var.priv_subnets_id)
  ami           = data.aws_ami.imagem_ec2.id
  instance_type = "t2.micro"
  subnet_id     = var.priv_subnets_id[count.index]
  tags = {
    Name = "coninch_front_ec2"
  }
}
