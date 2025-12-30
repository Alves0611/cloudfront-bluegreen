resource "null_resource" "update_distribution_with_cd_policy" {
  count = var.enable_staging_distribution ? 1 : 0

  triggers = {
    distribution_id                 = aws_cloudfront_distribution.this.id
    continuous_deployment_policy_id = aws_cloudfront_continuous_deployment_policy.this[0].id
    etag                            = data.aws_cloudfront_distribution.this[0].etag
  }

  provisioner "local-exec" {
    command = <<-EOT
      ETAG=$(aws cloudfront get-distribution-config --id ${aws_cloudfront_distribution.this.id} --query 'ETag' --output text)
      CONFIG=$(aws cloudfront get-distribution-config --id ${aws_cloudfront_distribution.this.id} --query 'DistributionConfig' --output json)
      UPDATED_CONFIG=$(echo "$CONFIG" | jq --arg policy_id "${aws_cloudfront_continuous_deployment_policy.this[0].id}" '.ContinuousDeploymentPolicyId = $policy_id')
      aws cloudfront update-distribution --id ${aws_cloudfront_distribution.this.id} --if-match "$ETAG" --distribution-config "$UPDATED_CONFIG" > /dev/null 2>&1 || true
    EOT
  }

  depends_on = [
    aws_cloudfront_distribution.this,
    aws_cloudfront_continuous_deployment_policy.this
  ]
}

