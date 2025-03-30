data "aws_ami" "imagem_ec2" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = [ "al2023-ami-2023.*-x86_64" ]
  }
}

resource "aws_security_group" "frontend" {
  vpc_id = var.vpc_id
  name = "lemke_front_sg"
  tags = {
    Name = "lemke_front_sg"
  }
}

resource "aws_instance" "lemke_front_ec2" {
  ami = data.aws_ami.imagem_ec2.id
  instance_type = "t2.micro"
  subnet_id = var.priv_subnets_id[0]
  associate_public_ip_address = true
  tags = {
    Name = "lemke_front_ec2"
  }
}