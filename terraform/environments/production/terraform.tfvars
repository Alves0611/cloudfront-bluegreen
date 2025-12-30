aws_region        = "us-east-1"
environment       = "prd"
domain_name       = "gabrielstudying.click"
route53_zone_name = "gabrielstudying.click"

common_tags = {
  ManagedBy   = "Terraform"
  Environment = "prd"
}

cloudfront_config = {
  enabled             = true
  default_root_object = "index.html"
  price_class         = "PriceClass_All"
  aliases             = ["gabrielstudying.click"]

  default_cache_behavior = {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    cache_policy_id        = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
  }

  ordered_cache_behaviors = []
}

enable_staging_distribution = true

