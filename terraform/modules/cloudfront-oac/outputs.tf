output "id" {
  description = "ID of the Origin Access Control"
  value       = aws_cloudfront_origin_access_control.this.id
}

output "name" {
  description = "Name of the Origin Access Control"
  value       = aws_cloudfront_origin_access_control.this.name
}

