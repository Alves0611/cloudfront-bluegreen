## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_origin_access_control.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the Origin Access Control | `string` | `"Origin Access Control for S3 bucket"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Origin Access Control | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the Origin Access Control |
| <a name="output_name"></a> [name](#output\_name) | Name of the Origin Access Control |
