resource "aws_cloudwatch_log_delivery_source" "cloudfront" {
  name         = var.source_name
  log_type     = "ACCESS_LOGS"
  resource_arn = var.cloudfront_distribution_arn
}

resource "aws_cloudwatch_log_delivery_destination" "s3" {
  name = var.destination_name

  delivery_destination_configuration {
    destination_resource_arn = var.s3_bucket_arn
  }
}

resource "aws_cloudwatch_log_delivery" "cloudfront_to_s3" {
  delivery_source_name     = aws_cloudwatch_log_delivery_source.cloudfront.name
  delivery_destination_arn = aws_cloudwatch_log_delivery_destination.s3.arn
}

