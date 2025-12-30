output "zone_id" {
  description = "Route53 hosted zone ID"
  value       = data.aws_route53_zone.this.zone_id
}

output "record_fqdn" {
  description = "FQDN of the created record"
  value       = aws_route53_record.cloudfront.fqdn
}

