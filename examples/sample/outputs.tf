# # Outputs for Terratest to validate


output "bucket_id" {
  description = "ID of the created bucket."
  value       = module.example.bucket_id
}

output "bucket_arn" {
  description = "ARN of the created bucket."
  value       = module.example.bucket_arn
}

output "s3_bucket_name" {
  description = "s3 bucket name"
  value       = module.example.s3_bucket_name
}

output "s3_bucket_region" {
  description = "Account on which s3 bucket is created"
  value       = module.example.s3_bucket_region
}

output "s3_bucket_domain_fqdn" {
  description = "s3 bucket fqdn"
  value       = module.example.s3_bucket_domain_fqdn
}