locals {
  example_ami = "ami-03b4b78aae82b30f1"
  example_instance_type = "t2.nano"
}

resource "aws_instance" "sandbox" {
  count = 3
  ami = local.example_ami
  instance_type = local.example_instance_type
  vpc_security_group_ids = [aws_security_group.example_ec2.id]

  tags = {
    Name = "${format("sandbox-%02d", count.index + 1)}"
  }

  user_data = file("./user_data.sh")
}
