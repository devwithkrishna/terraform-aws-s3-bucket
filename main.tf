# #This is the main configuration file where Azure resources are defined
# #It contains the actual infrastructure as code declarations

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "s3" {
  bucket              = var.bucket_name
  force_destroy       = var.force_destroy
  object_lock_enabled = var.object_lock_enabled
  tags = {
    Environment     = var.environment
    ApplicationName = var.application_name
    Temporary       = var.temporary
  }
}

