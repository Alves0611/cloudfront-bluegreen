module "site_bucket" {
  source = "../../modules/s3-bucket"

  bucket_name   = local.bucket_name_site
  force_destroy = false
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

module "site_bucket_staging" {
  count  = var.enable_staging_distribution ? 1 : 0
  source = "../../modules/s3-bucket"

  bucket_name   = local.bucket_name_site_staging
  force_destroy = false
  tags = merge(
    var.common_tags,
    {
      Name        = local.bucket_name_site_staging
      Purpose     = "Staging site content for CD testing"
      Environment = var.environment
    }
  )
}

module "cloudfront_oac" {
  source = "../../modules/cloudfront-oac"

  name        = local.oac_name
  description = "OAC for ${var.domain_name} - ${var.environment}"
}

module "cloudfront_oac_staging" {
  count  = var.enable_staging_distribution ? 1 : 0
  source = "../../modules/cloudfront-oac"

  name        = local.oac_name_staging
  description = "OAC for ${var.domain_name} - ${var.environment} staging distribution"
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

  enable_staging_distribution            = var.enable_staging_distribution
  staging_s3_bucket_regional_domain_name = var.enable_staging_distribution ? module.site_bucket_staging[0].bucket_regional_domain_name : null
  staging_origin_access_control_id       = var.enable_staging_distribution ? module.cloudfront_oac_staging[0].id : null
  wait_for_deployment                    = false

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

module "site_bucket_staging_policy" {
  count  = var.enable_staging_distribution ? 1 : 0
  source = "../../modules/s3-bucket-policy"

  bucket_id  = module.site_bucket_staging[0].bucket_id
  bucket_arn = module.site_bucket_staging[0].bucket_arn
  cloudfront_distribution_arns = [
    module.cloudfront_distribution.distribution_arn,
    module.cloudfront_distribution.staging_distribution_arn
  ]

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

