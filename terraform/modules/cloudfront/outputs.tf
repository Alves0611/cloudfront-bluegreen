output "distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.this.id
}

output "distribution_arn" {
  description = "ARN of the CloudFront distribution"
  value       = aws_cloudfront_distribution.this.arn
}

output "distribution_domain_name" {
  description = "Domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.this.domain_name
}

output "distribution_hosted_zone_id" {
  description = "Hosted zone ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.this.hosted_zone_id
}

output "distribution_status" {
  description = "Status of the CloudFront distribution"
  value       = aws_cloudfront_distribution.this.status
}

output "staging_distribution_id" {
  description = "ID of the staging CloudFront distribution"
  value       = var.enable_staging_distribution ? aws_cloudfront_distribution.staging[0].id : null
}

output "staging_distribution_domain_name" {
  description = "Domain name of the staging CloudFront distribution"
  value       = var.enable_staging_distribution ? aws_cloudfront_distribution.staging[0].domain_name : null
}

output "staging_distribution_arn" {
  description = "ARN of the staging CloudFront distribution"
  value       = var.enable_staging_distribution ? aws_cloudfront_distribution.staging[0].arn : null
}

output "continuous_deployment_policy_id" {
  description = "ID of the continuous deployment policy"
  value       = var.enable_staging_distribution ? aws_cloudfront_continuous_deployment_policy.this[0].id : null
}

