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

