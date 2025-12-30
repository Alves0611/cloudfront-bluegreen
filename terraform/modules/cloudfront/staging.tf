resource "aws_cloudfront_distribution" "staging" {
  count = var.enable_staging_distribution ? 1 : 0

  enabled             = true
  default_root_object = var.default_root_object
  price_class         = var.price_class
  comment             = "${var.comment} - Staging"
  is_ipv6_enabled     = var.is_ipv6_enabled
  staging             = true

  origin {
    domain_name              = var.staging_s3_bucket_regional_domain_name
    origin_access_control_id = var.staging_origin_access_control_id
    origin_id                = var.staging_s3_bucket_regional_domain_name
  }

  default_cache_behavior {
    allowed_methods        = var.default_cache_behavior.allowed_methods
    cached_methods         = var.default_cache_behavior.cached_methods
    target_origin_id       = var.staging_s3_bucket_regional_domain_name
    cache_policy_id        = var.default_cache_behavior.cache_policy_id
    viewer_protocol_policy = var.default_cache_behavior.viewer_protocol_policy
    compress               = var.default_cache_behavior.compress
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
      prefix          = "${var.logging_prefix}staging/"
    }
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.comment} - Staging"
    }
  )
}

resource "aws_cloudfront_continuous_deployment_policy" "this" {
  count = var.enable_staging_distribution ? 1 : 0

  enabled = true

  staging_distribution_dns_names {
    items    = [aws_cloudfront_distribution.staging[0].domain_name]
    quantity = 1
  }

  traffic_config {
    type = "SingleHeader"
    single_header_config {
      header = "aws-cf-cd-preview"
      value  = "1"
    }
  }

  depends_on = [aws_cloudfront_distribution.staging]
}

