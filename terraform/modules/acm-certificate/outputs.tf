output "certificate_arn" {
  description = "ARN of the ACM certificate"
  value       = aws_acm_certificate.this.arn
}

output "certificate_domain_validation_options" {
  description = "Domain validation options for the certificate"
  value       = aws_acm_certificate.this.domain_validation_options
}

output "certificate_validation_arn" {
  description = "ARN of the validated certificate"
  value       = aws_acm_certificate_validation.this.certificate_arn
}

