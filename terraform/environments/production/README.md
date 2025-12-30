## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm_certificate"></a> [acm\_certificate](#module\_acm\_certificate) | ../../modules/acm-certificate | n/a |
| <a name="module_cloudfront_distribution"></a> [cloudfront\_distribution](#module\_cloudfront\_distribution) | ../../modules/cloudfront | n/a |
| <a name="module_cloudfront_oac"></a> [cloudfront\_oac](#module\_cloudfront\_oac) | ../../modules/cloudfront-oac | n/a |
| <a name="module_cloudfront_oac_staging"></a> [cloudfront\_oac\_staging](#module\_cloudfront\_oac\_staging) | ../../modules/cloudfront-oac | n/a |
| <a name="module_cloudwatch_logs"></a> [cloudwatch\_logs](#module\_cloudwatch\_logs) | ../../modules/cloudwatch-logs | n/a |
| <a name="module_logs_bucket"></a> [logs\_bucket](#module\_logs\_bucket) | ../../modules/s3-bucket | n/a |
| <a name="module_route53_record"></a> [route53\_record](#module\_route53\_record) | ../../modules/route53 | n/a |
| <a name="module_site_bucket"></a> [site\_bucket](#module\_site\_bucket) | ../../modules/s3-bucket | n/a |
| <a name="module_site_bucket_policy"></a> [site\_bucket\_policy](#module\_site\_bucket\_policy) | ../../modules/s3-bucket-policy | n/a |
| <a name="module_site_bucket_staging"></a> [site\_bucket\_staging](#module\_site\_bucket\_staging) | ../../modules/s3-bucket | n/a |
| <a name="module_site_bucket_staging_policy"></a> [site\_bucket\_staging\_policy](#module\_site\_bucket\_staging\_policy) | ../../modules/s3-bucket-policy | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region for resources | `string` | `"us-east-1"` | no |
| <a name="input_cloudfront_config"></a> [cloudfront\_config](#input\_cloudfront\_config) | CloudFront distribution configuration | <pre>object({<br/>    enabled             = bool<br/>    default_root_object = string<br/>    price_class         = string<br/>    aliases             = list(string)<br/>    default_cache_behavior = object({<br/>      allowed_methods        = list(string)<br/>      cached_methods         = list(string)<br/>      cache_policy_id        = string<br/>      viewer_protocol_policy = string<br/>      compress               = bool<br/>    })<br/>    ordered_cache_behaviors = list(object({<br/>      path_pattern             = string<br/>      allowed_methods          = list(string)<br/>      cached_methods           = list(string)<br/>      target_origin_id         = string<br/>      cache_policy_id          = string<br/>      origin_request_policy_id = optional(string)<br/>      viewer_protocol_policy  = string<br/>      compress                 = optional(bool)<br/>    }))<br/>  })</pre> | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to apply to all resources | `map(string)` | <pre>{<br/>  "Environment": "production",<br/>  "ManagedBy": "Terraform"<br/>}</pre> | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name for the site | `string` | n/a | yes |
| <a name="input_enable_staging_distribution"></a> [enable\_staging\_distribution](#input\_enable\_staging\_distribution) | Enable staging distribution for continuous deployment (blue-green) | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | `"production"` | no |
| <a name="input_route53_zone_name"></a> [route53\_zone\_name](#input\_route53\_zone\_name) | Route53 hosted zone name (e.g., example.com) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_arn"></a> [acm\_certificate\_arn](#output\_acm\_certificate\_arn) | ACM certificate ARN |
| <a name="output_cloudfront_distribution_arn"></a> [cloudfront\_distribution\_arn](#output\_cloudfront\_distribution\_arn) | CloudFront distribution ARN |
| <a name="output_cloudfront_distribution_domain_name"></a> [cloudfront\_distribution\_domain\_name](#output\_cloudfront\_distribution\_domain\_name) | CloudFront distribution domain name |
| <a name="output_cloudfront_distribution_id"></a> [cloudfront\_distribution\_id](#output\_cloudfront\_distribution\_id) | CloudFront distribution ID |
| <a name="output_continuous_deployment_policy_id"></a> [continuous\_deployment\_policy\_id](#output\_continuous\_deployment\_policy\_id) | Continuous deployment policy ID |
| <a name="output_logs_bucket_id"></a> [logs\_bucket\_id](#output\_logs\_bucket\_id) | S3 logs bucket ID |
| <a name="output_route53_record_fqdn"></a> [route53\_record\_fqdn](#output\_route53\_record\_fqdn) | Route53 record FQDN |
| <a name="output_site_bucket_arn"></a> [site\_bucket\_arn](#output\_site\_bucket\_arn) | S3 site bucket ARN |
| <a name="output_site_bucket_id"></a> [site\_bucket\_id](#output\_site\_bucket\_id) | S3 site bucket ID |
| <a name="output_staging_bucket_id"></a> [staging\_bucket\_id](#output\_staging\_bucket\_id) | S3 staging bucket ID for continuous deployment |
| <a name="output_staging_distribution_id"></a> [staging\_distribution\_id](#output\_staging\_distribution\_id) | CloudFront staging distribution ID |
