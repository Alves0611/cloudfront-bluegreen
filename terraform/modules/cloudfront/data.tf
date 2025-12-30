data "aws_cloudfront_distribution" "this" {
  count = var.enable_staging_distribution ? 1 : 0
  id    = aws_cloudfront_distribution.this.id
}