# This file defines output values that will be displayed after Terraform applies
# Outputs are useful for getting information about created resources

output "bucket_id" {
  description = "s3 bucket id"
  value       = aws_s3_bucket.s3.id
}

output "bucket_arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.s3.arn
}

output "s3_bucket_name" {
  description = "s3 bucket name"
  value       = aws_s3_bucket.s3.bucket
}

output "s3_bucket_region" {
  description = "Account on which s3 bucket is created"
  value       = aws_s3_bucket.s3.region
}

output "s3_bucket_domain_fqdn" {
  description = "s3 bucket fqdn"
  value       = aws_s3_bucket.s3.bucket_domain_name
}

output "s3_tags" {
  description = "S3 bucket tags"
  value = aws_s3_bucket.s3.tags
}