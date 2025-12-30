data "aws_route53_zone" "this" {
  name         = var.zone_name
  private_zone = false
}

resource "aws_route53_record" "cloudfront" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.record_name
  type    = "A"

  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_hosted_zone_id
    evaluate_target_health = var.evaluate_target_health
  }
}

resource "aws_route53_record" "cloudfront_ipv6" {
  count = var.create_ipv6_record ? 1 : 0

  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.record_name
  type    = "AAAA"

  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_hosted_zone_id
    evaluate_target_health = var.evaluate_target_health
  }
}

