resource "aws_subnet" "manage" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.254.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-3a"
}
