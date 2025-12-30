locals {
  s3_origin_id = var.s3_bucket_regional_domain_name
}

resource "aws_cloudfront_distribution" "this" {
  enabled             = var.enabled
  default_root_object = var.default_root_object
  price_class         = var.price_class
  aliases             = var.aliases
  comment             = var.comment
  is_ipv6_enabled     = var.is_ipv6_enabled

  origin {
    domain_name              = var.s3_bucket_regional_domain_name
    origin_access_control_id = var.origin_access_control_id
    origin_id                = local.s3_origin_id
  }

  default_cache_behavior {
    allowed_methods        = var.default_cache_behavior.allowed_methods
    cached_methods         = var.default_cache_behavior.cached_methods
    target_origin_id       = local.s3_origin_id
    cache_policy_id        = var.default_cache_behavior.cache_policy_id
    viewer_protocol_policy = var.default_cache_behavior.viewer_protocol_policy
    compress               = var.default_cache_behavior.compress
  }

  dynamic "ordered_cache_behavior" {
    for_each = var.ordered_cache_behaviors

    content {
      path_pattern             = ordered_cache_behavior.value.path_pattern
      allowed_methods          = ordered_cache_behavior.value.allowed_methods
      cached_methods           = ordered_cache_behavior.value.cached_methods
      target_origin_id         = ordered_cache_behavior.value.target_origin_id
      cache_policy_id          = ordered_cache_behavior.value.cache_policy_id
      origin_request_policy_id = lookup(ordered_cache_behavior.value, "origin_request_policy_id", null)
      viewer_protocol_policy   = ordered_cache_behavior.value.viewer_protocol_policy
      compress                 = lookup(ordered_cache_behavior.value, "compress", false)
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = var.geo_restriction_type
      locations        = var.geo_restriction_locations
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = var.minimum_protocol_version
  }

  dynamic "logging_config" {
    for_each = var.logging_bucket != "" ? [1] : []
    content {
      bucket          = var.logging_bucket
      include_cookies = var.logging_include_cookies
      prefix          = var.logging_prefix
    }
  }

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

