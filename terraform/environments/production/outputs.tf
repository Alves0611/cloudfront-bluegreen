output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value       = module.cloudfront_distribution.distribution_id
}

output "cloudfront_distribution_arn" {
  description = "CloudFront distribution ARN"
  value       = module.cloudfront_distribution.distribution_arn
}

output "cloudfront_distribution_domain_name" {
  description = "CloudFront distribution domain name"
  value       = module.cloudfront_distribution.distribution_domain_name
}

output "site_bucket_id" {
  description = "S3 site bucket ID"
  value       = module.site_bucket.bucket_id
}

output "site_bucket_arn" {
  description = "S3 site bucket ARN"
  value       = module.site_bucket.bucket_arn
}

output "logs_bucket_id" {
  description = "S3 logs bucket ID"
  value       = module.logs_bucket.bucket_id
}

output "acm_certificate_arn" {
  description = "ACM certificate ARN"
  value       = module.acm_certificate.certificate_validation_arn
}

output "route53_record_fqdn" {
  description = "Route53 record FQDN"
  value       = module.route53_record.record_fqdn
}

output "staging_bucket_id" {
  description = "S3 staging bucket ID for continuous deployment"
  value       = var.enable_staging_distribution ? module.site_bucket_staging[0].bucket_id : null
}

output "staging_distribution_id" {
  description = "CloudFront staging distribution ID"
  value       = var.enable_staging_distribution ? module.cloudfront_distribution.staging_distribution_id : null
}

output "continuous_deployment_policy_id" {
  description = "Continuous deployment policy ID"
  value       = var.enable_staging_distribution ? module.cloudfront_distribution.continuous_deployment_policy_id : null
}

