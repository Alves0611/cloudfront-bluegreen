resource "aws_iam_role" "github_actions" {
  name = "github-actions-cloudfront-deploy"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github_actions.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = var.github_repo_subject
          }
        }
      },
    ]
  })

  tags = merge(
    var.common_tags,
    {
      Name = "github-actions-cloudfront-deploy"
    }
  )
}

data "aws_iam_policy_document" "cloudfront_deploy" {
  statement {
    sid    = "S3BucketAccess"
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::*-site-*",
      "arn:aws:s3:::*-site-*/*",
      "arn:aws:s3:::*-logs-*",
      "arn:aws:s3:::*-logs-*/*"
    ]
  }

  statement {
    sid    = "CloudFrontInvalidation"
    effect = "Allow"
    actions = [
      "cloudfront:CreateInvalidation",
      "cloudfront:GetDistribution",
      "cloudfront:GetInvalidation"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "ACMReadOnly"
    effect = "Allow"
    actions = [
      "acm:DescribeCertificate",
      "acm:ListCertificates"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "Route53ReadOnly"
    effect = "Allow"
    actions = [
      "route53:GetChange",
      "route53:ListHostedZones",
      "route53:ListResourceRecordSets"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "cloudfront_deploy" {
  name   = "cloudfront-deploy-policy"
  role   = aws_iam_role.github_actions.id
  policy = data.aws_iam_policy_document.cloudfront_deploy.json
}

