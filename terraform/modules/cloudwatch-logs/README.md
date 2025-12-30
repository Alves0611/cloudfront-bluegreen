## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_delivery.cloudfront_to_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_delivery) | resource |
| [aws_cloudwatch_log_delivery_destination.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_delivery_destination) | resource |
| [aws_cloudwatch_log_delivery_source.cloudfront](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_delivery_source) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudfront_distribution_arn"></a> [cloudfront\_distribution\_arn](#input\_cloudfront\_distribution\_arn) | ARN of the CloudFront distribution | `string` | n/a | yes |
| <a name="input_destination_name"></a> [destination\_name](#input\_destination\_name) | Name of the CloudWatch log delivery destination | `string` | n/a | yes |
| <a name="input_s3_bucket_arn"></a> [s3\_bucket\_arn](#input\_s3\_bucket\_arn) | ARN of the S3 bucket for logs | `string` | n/a | yes |
| <a name="input_source_name"></a> [source\_name](#input\_source\_name) | Name of the CloudWatch log delivery source | `string` | n/a | yes |


