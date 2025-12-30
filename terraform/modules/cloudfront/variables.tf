variable "enabled" {
  description = "Whether the distribution is enabled"
  type        = bool
  default     = true
}

variable "default_root_object" {
  description = "Default root object for the distribution"
  type        = string
  default     = "index.html"
}

variable "price_class" {
  description = "Price class for the distribution"
  type        = string
  default     = "PriceClass_100"
}

variable "aliases" {
  description = "List of aliases (CNAMEs) for the distribution"
  type        = list(string)
  default     = []
}

variable "comment" {
  description = "Comment for the distribution"
  type        = string
  default     = ""
}

variable "is_ipv6_enabled" {
  description = "Whether IPv6 is enabled"
  type        = bool
  default     = true
}

variable "s3_bucket_regional_domain_name" {
  description = "Regional domain name of the S3 bucket"
  type        = string
}

variable "origin_access_control_id" {
  description = "ID of the Origin Access Control"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate"
  type        = string
}

variable "minimum_protocol_version" {
  description = "Minimum SSL/TLS protocol version"
  type        = string
  default     = "TLSv1.2_2021"
}

variable "default_cache_behavior" {
  description = "Default cache behavior configuration"
  type = object({
    allowed_methods        = list(string)
    cached_methods         = list(string)
    cache_policy_id        = string
    viewer_protocol_policy = string
    compress               = bool
  })
}

variable "ordered_cache_behaviors" {
  description = "Ordered cache behaviors"
  type = list(object({
    path_pattern             = string
    allowed_methods          = list(string)
    cached_methods           = list(string)
    target_origin_id         = string
    cache_policy_id          = string
    origin_request_policy_id = optional(string)
    viewer_protocol_policy   = string
    compress                 = optional(bool)
  }))
  default = []
}

variable "geo_restriction_type" {
  description = "Type of geo restriction"
  type        = string
  default     = "none"
}

variable "geo_restriction_locations" {
  description = "List of country codes for geo restriction"
  type        = list(string)
  default     = []
}

variable "logging_bucket" {
  description = "S3 bucket for CloudFront access logs"
  type        = string
  default     = ""
}

variable "logging_include_cookies" {
  description = "Include cookies in access logs"
  type        = bool
  default     = false
}

variable "logging_prefix" {
  description = "Prefix for access logs"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the distribution"
  type        = map(string)
  default     = {}
}

