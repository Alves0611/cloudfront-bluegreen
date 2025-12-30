variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "force_destroy" {
  description = "Allow deletion of bucket with objects"
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Enable versioning on the bucket"
  type        = bool
  default     = false
}

variable "encryption_algorithm" {
  description = "Server-side encryption algorithm"
  type        = string
  default     = "AES256"
}

variable "bucket_key_enabled" {
  description = "Enable S3 bucket key for SSE-KMS"
  type        = bool
  default     = false
}

variable "block_public_access" {
  description = "Block all public access to the bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the bucket"
  type        = map(string)
  default     = {}
}

variable "object_ownership" {
  description = "Object ownership setting for the bucket"
  type        = string
  default     = "BucketOwnerEnforced"
}

variable "enable_acl" {
  description = "Enable ACL on the bucket (required for CloudFront logs)"
  type        = bool
  default     = false
}

variable "acl_value" {
  description = "ACL value when enable_acl is true"
  type        = string
  default     = "private"
}

