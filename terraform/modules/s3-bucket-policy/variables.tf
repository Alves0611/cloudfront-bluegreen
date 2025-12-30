variable "bucket_id" {
  description = "ID of the S3 bucket"
  type        = string
}

variable "bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}

variable "cloudfront_distribution_arns" {
  description = "List of CloudFront distribution ARNs allowed to access the bucket"
  type        = list(string)
}

