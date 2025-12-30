## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_continuous_deployment_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_continuous_deployment_policy) | resource |
| [aws_cloudfront_distribution.staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [null_resource.update_distribution_with_cd_policy](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_cloudfront_distribution.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudfront_distribution) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | ARN of the ACM certificate | `string` | n/a | yes |
| <a name="input_aliases"></a> [aliases](#input\_aliases) | List of aliases (CNAMEs) for the distribution | `list(string)` | `[]` | no |
| <a name="input_comment"></a> [comment](#input\_comment) | Comment for the distribution | `string` | `""` | no |
| <a name="input_continuous_deployment_policy_id"></a> [continuous\_deployment\_policy\_id](#input\_continuous\_deployment\_policy\_id) | ID of the continuous deployment policy (for blue-green deployments) | `string` | `null` | no |
| <a name="input_default_cache_behavior"></a> [default\_cache\_behavior](#input\_default\_cache\_behavior) | Default cache behavior configuration | <pre>object({<br/>    allowed_methods        = list(string)<br/>    cached_methods         = list(string)<br/>    cache_policy_id        = string<br/>    viewer_protocol_policy = string<br/>    compress               = bool<br/>  })</pre> | n/a | yes |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | Default root object for the distribution | `string` | `"index.html"` | no |
| <a name="input_enable_staging_distribution"></a> [enable\_staging\_distribution](#input\_enable\_staging\_distribution) | Enable staging distribution for continuous deployment | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether the distribution is enabled | `bool` | `true` | no |
| <a name="input_geo_restriction_locations"></a> [geo\_restriction\_locations](#input\_geo\_restriction\_locations) | List of country codes for geo restriction | `list(string)` | `[]` | no |
| <a name="input_geo_restriction_type"></a> [geo\_restriction\_type](#input\_geo\_restriction\_type) | Type of geo restriction | `string` | `"none"` | no |
| <a name="input_is_ipv6_enabled"></a> [is\_ipv6\_enabled](#input\_is\_ipv6\_enabled) | Whether IPv6 is enabled | `bool` | `true` | no |
| <a name="input_logging_bucket"></a> [logging\_bucket](#input\_logging\_bucket) | S3 bucket for CloudFront access logs | `string` | `""` | no |
| <a name="input_logging_include_cookies"></a> [logging\_include\_cookies](#input\_logging\_include\_cookies) | Include cookies in access logs | `bool` | `false` | no |
| <a name="input_logging_prefix"></a> [logging\_prefix](#input\_logging\_prefix) | Prefix for access logs | `string` | `""` | no |
| <a name="input_minimum_protocol_version"></a> [minimum\_protocol\_version](#input\_minimum\_protocol\_version) | Minimum SSL/TLS protocol version | `string` | `"TLSv1.2_2021"` | no |
| <a name="input_ordered_cache_behaviors"></a> [ordered\_cache\_behaviors](#input\_ordered\_cache\_behaviors) | Ordered cache behaviors | <pre>list(object({<br/>    path_pattern             = string<br/>    allowed_methods          = list(string)<br/>    cached_methods           = list(string)<br/>    target_origin_id         = string<br/>    cache_policy_id          = string<br/>    origin_request_policy_id = optional(string)<br/>    viewer_protocol_policy   = string<br/>    compress                 = optional(bool)<br/>  }))</pre> | `[]` | no |
| <a name="input_origin_access_control_id"></a> [origin\_access\_control\_id](#input\_origin\_access\_control\_id) | ID of the Origin Access Control | `string` | n/a | yes |
| <a name="input_price_class"></a> [price\_class](#input\_price\_class) | Price class for the distribution | `string` | `"PriceClass_100"` | no |
| <a name="input_s3_bucket_regional_domain_name"></a> [s3\_bucket\_regional\_domain\_name](#input\_s3\_bucket\_regional\_domain\_name) | Regional domain name of the S3 bucket | `string` | n/a | yes |
| <a name="input_staging_distribution_domain_name"></a> [staging\_distribution\_domain\_name](#input\_staging\_distribution\_domain\_name) | Domain name of the staging distribution (for continuous deployment) | `string` | `null` | no |
| <a name="input_staging_origin_access_control_id"></a> [staging\_origin\_access\_control\_id](#input\_staging\_origin\_access\_control\_id) | OAC ID for staging bucket | `string` | `null` | no |
| <a name="input_staging_s3_bucket_regional_domain_name"></a> [staging\_s3\_bucket\_regional\_domain\_name](#input\_staging\_s3\_bucket\_regional\_domain\_name) | Regional domain name of the staging S3 bucket | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the distribution | `map(string)` | `{}` | no |
| <a name="input_wait_for_deployment"></a> [wait\_for\_deployment](#input\_wait\_for\_deployment) | Whether to wait for the distribution to be deployed | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_continuous_deployment_policy_id"></a> [continuous\_deployment\_policy\_id](#output\_continuous\_deployment\_policy\_id) | ID of the continuous deployment policy |
| <a name="output_distribution_arn"></a> [distribution\_arn](#output\_distribution\_arn) | ARN of the CloudFront distribution |
| <a name="output_distribution_domain_name"></a> [distribution\_domain\_name](#output\_distribution\_domain\_name) | Domain name of the CloudFront distribution |
| <a name="output_distribution_hosted_zone_id"></a> [distribution\_hosted\_zone\_id](#output\_distribution\_hosted\_zone\_id) | Hosted zone ID of the CloudFront distribution |
| <a name="output_distribution_id"></a> [distribution\_id](#output\_distribution\_id) | ID of the CloudFront distribution |
| <a name="output_distribution_status"></a> [distribution\_status](#output\_distribution\_status) | Status of the CloudFront distribution |
| <a name="output_staging_distribution_arn"></a> [staging\_distribution\_arn](#output\_staging\_distribution\_arn) | ARN of the staging CloudFront distribution |
| <a name="output_staging_distribution_domain_name"></a> [staging\_distribution\_domain\_name](#output\_staging\_distribution\_domain\_name) | Domain name of the staging CloudFront distribution |
| <a name="output_staging_distribution_id"></a> [staging\_distribution\_id](#output\_staging\_distribution\_id) | ID of the staging CloudFront distribution |
