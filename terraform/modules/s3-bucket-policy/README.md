## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_iam_policy_document.allow_oac_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_arn"></a> [bucket\_arn](#input\_bucket\_arn) | ARN of the S3 bucket | `string` | n/a | yes |
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | ID of the S3 bucket | `string` | n/a | yes |
| <a name="input_cloudfront_distribution_arns"></a> [cloudfront\_distribution\_arns](#input\_cloudfront\_distribution\_arns) | List of CloudFront distribution ARNs allowed to access the bucket | `list(string)` | n/a | yes |


