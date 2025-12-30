## Resources

| Name | Type |
|------|------|
| [aws_route53_record.cloudfront](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.cloudfront_ipv6](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudfront_domain_name"></a> [cloudfront\_domain\_name](#input\_cloudfront\_domain\_name) | CloudFront distribution domain name | `string` | n/a | yes |
| <a name="input_cloudfront_hosted_zone_id"></a> [cloudfront\_hosted\_zone\_id](#input\_cloudfront\_hosted\_zone\_id) | CloudFront distribution hosted zone ID | `string` | n/a | yes |
| <a name="input_create_ipv6_record"></a> [create\_ipv6\_record](#input\_create\_ipv6\_record) | Create AAAA record for IPv6 | `bool` | `true` | no |
| <a name="input_evaluate_target_health"></a> [evaluate\_target\_health](#input\_evaluate\_target\_health) | Evaluate target health | `bool` | `false` | no |
| <a name="input_record_name"></a> [record\_name](#input\_record\_name) | DNS record name (e.g., www.example.com or example.com) | `string` | n/a | yes |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | Route53 hosted zone name (e.g., example.com) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_record_fqdn"></a> [record\_fqdn](#output\_record\_fqdn) | FQDN of the created record |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | Route53 hosted zone ID |
