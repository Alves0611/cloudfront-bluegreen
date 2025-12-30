locals {
  bucket_name_site         = "${var.domain_name}-site-${var.environment}"
  bucket_name_site_staging = "${var.domain_name}-site-${var.environment}-staging"
  bucket_name_logs         = "${var.domain_name}-logs-${var.environment}"
  oac_name                 = "${var.domain_name}-oac-${var.environment}"
  oac_name_staging         = "${var.domain_name}-oac-${var.environment}-staging"
  certificate_name         = "${var.domain_name}-cert-${var.environment}"
}