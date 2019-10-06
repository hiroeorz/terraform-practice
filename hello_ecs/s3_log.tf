resource "aws_s3_bucket" "alb_log" {
  bucket = "alb-log.hiroe.komatsuelec.co.jp"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}
