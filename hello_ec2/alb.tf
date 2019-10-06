resource "aws_alb" "example" {
  name = "example"
  load_balancer_type = "application"
  internal = false
  idle_timeout = 60
  enable_deletion_protection = true

  subnets = [
    aws_subnet.public_0.id,
    aws_subnet.public_1.id,
  ]

  access_logs {
    bucket = aws_s3_bucket.alb_log.id
    enabled = true
  }
}
