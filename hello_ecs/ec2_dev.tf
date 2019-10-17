locals {
  amazon_linux_2_ami = "ami-03b4b78aae82b30f1"
}

resource "aws_instance" "docker-packer" {
  count                       = 1
  ami                         = local.amazon_linux_2_ami
  instance_type               = "t2.nano"
  subnet_id                   = aws_subnet.manage.id
  vpc_security_group_ids      = [module.ssh_sg.security_group_id]
  key_name                    = "aws_paris"
  associate_public_ip_address = true
  tags                        = { Name = "docker-packer" }
  user_data                   = file("./setup_docker.sh")
}
