variable "zone_name" {
  description = "Route53 hosted zone name (e.g., example.com)"
  type        = string
}

variable "record_name" {
  description = "DNS record name (e.g., www.example.com or example.com)"
  type        = string
}

variable "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  type        = string
}

variable "cloudfront_hosted_zone_id" {
  description = "CloudFront distribution hosted zone ID"
  type        = string
}

variable "evaluate_target_health" {
  description = "Evaluate target health"
  type        = bool
  default     = false
}

variable "create_ipv6_record" {
  description = "Create AAAA record for IPv6"
  type        = bool
  default     = true
}

