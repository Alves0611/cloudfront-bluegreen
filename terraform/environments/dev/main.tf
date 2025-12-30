locals {
  bucket_name_site = "${var.domain_name}-site-${var.environment}"
  bucket_name_logs = "${var.domain_name}-logs-${var.environment}"
  oac_name         = "${var.domain_name}-oac-${var.environment}"
  certificate_name = "${var.domain_name}-cert-${var.environment}"
}

module "site_bucket" {
  source = "../../modules/s3-bucket"

  bucket_name   = local.bucket_name_site
  force_destroy = true
  tags = merge(
    var.common_tags,
    {
      Name        = local.bucket_name_site
      Purpose     = "Site content"
      Environment = var.environment
    }
  )
}

module "logs_bucket" {
  source = "../../modules/s3-bucket"

  bucket_name      = local.bucket_name_logs
  force_destroy    = true
  enable_acl       = true
  acl_value        = "private"
  object_ownership = "BucketOwnerPreferred"
  tags = merge(
    var.common_tags,
    {
      Name        = local.bucket_name_logs
      Purpose     = "CloudFront logs"
      Environment = var.environment
    }
  )
}

module "cloudfront_oac" {
  source = "../../modules/cloudfront-oac"

  name        = local.oac_name
  description = "OAC for ${var.domain_name} - ${var.environment}"
}

module "acm_certificate" {
  source = "../../modules/acm-certificate"

  domain_name       = var.domain_name
  route53_zone_name = var.route53_zone_name
  certificate_name  = local.certificate_name
  tags = merge(
    var.common_tags,
    {
      Name = local.certificate_name
    }
  )
}

module "cloudfront_distribution" {
  source = "../../modules/cloudfront"

  enabled             = var.cloudfront_config.enabled
  default_root_object = var.cloudfront_config.default_root_object
  price_class         = var.cloudfront_config.price_class
  aliases             = var.cloudfront_config.aliases
  comment             = "CloudFront distribution for ${var.domain_name} - ${var.environment}"

  s3_bucket_regional_domain_name = module.site_bucket.bucket_regional_domain_name
  origin_access_control_id       = module.cloudfront_oac.id
  acm_certificate_arn            = module.acm_certificate.certificate_validation_arn

  default_cache_behavior  = var.cloudfront_config.default_cache_behavior
  ordered_cache_behaviors = var.cloudfront_config.ordered_cache_behaviors

  logging_bucket          = module.logs_bucket.bucket_regional_domain_name
  logging_include_cookies = false
  logging_prefix          = "cloudfront-access-logs/"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.domain_name}-cloudfront-${var.environment}"
    }
  )
}

module "site_bucket_policy" {
  source = "../../modules/s3-bucket-policy"

  bucket_id                    = module.site_bucket.bucket_id
  bucket_arn                   = module.site_bucket.bucket_arn
  cloudfront_distribution_arns = [module.cloudfront_distribution.distribution_arn]

  depends_on = [module.cloudfront_distribution]
}

module "route53_record" {
  source = "../../modules/route53"

  zone_name                 = var.route53_zone_name
  record_name               = var.domain_name
  cloudfront_domain_name    = module.cloudfront_distribution.distribution_domain_name
  cloudfront_hosted_zone_id = module.cloudfront_distribution.distribution_hosted_zone_id
  evaluate_target_health    = false
  create_ipv6_record        = true
}

module "cloudwatch_logs" {
  source = "../../modules/cloudwatch-logs"

  source_name                 = "${module.cloudfront_distribution.distribution_id}-logs"
  destination_name            = replace(module.logs_bucket.bucket_id, ".", "-")
  cloudfront_distribution_arn = module.cloudfront_distribution.distribution_arn
  s3_bucket_arn               = module.logs_bucket.bucket_arn
}

