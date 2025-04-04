data "aws_ami" "imagem_ec2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}
resource "aws_security_group" "coninch_back_sg" {
  vpc_id = var.vpc_id
  name   = "coninch_back_sg"
  tags = {
    Name = "coninch-back_sg"
  }
}

resource "aws_instance" "coninch_back_ec2" {
  for_each      = toset(var.priv_subnets_id)
  ami           = data.aws_ami.imagem_ec2.id
  instance_type = "t2.micro"
  subnet_id     = each.value
  tags = {
    Name = "coninch_back_ec2"
  }
}
