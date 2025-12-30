variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "domain_name" {
  description = "Domain name for the site"
  type        = string
}

variable "route53_zone_name" {
  description = "Route53 hosted zone name (e.g., example.com)"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    ManagedBy   = "Terraform"
    Environment = "dev"
  }
}

variable "cloudfront_config" {
  description = "CloudFront distribution configuration"
  type = object({
    enabled             = bool
    default_root_object = string
    price_class         = string
    aliases             = list(string)
    default_cache_behavior = object({
      allowed_methods        = list(string)
      cached_methods         = list(string)
      cache_policy_id        = string
      viewer_protocol_policy = string
      compress               = bool
    })
    ordered_cache_behaviors = list(object({
      path_pattern             = string
      allowed_methods          = list(string)
      cached_methods           = list(string)
      target_origin_id         = string
      cache_policy_id          = string
      origin_request_policy_id = optional(string)
      viewer_protocol_policy   = string
      compress                 = optional(bool)
    }))
  })
}

