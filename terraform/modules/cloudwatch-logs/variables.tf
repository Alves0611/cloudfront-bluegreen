variable "source_name" {
  description = "Name of the CloudWatch log delivery source"
  type        = string
}

variable "destination_name" {
  description = "Name of the CloudWatch log delivery destination"
  type        = string
}

variable "cloudfront_distribution_arn" {
  description = "ARN of the CloudFront distribution"
  type        = string
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket for logs"
  type        = string
}

