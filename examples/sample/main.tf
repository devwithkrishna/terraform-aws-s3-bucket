# # Minimal Terraform configuration for Terratest testing

module "example" {
  source              = "../.." # path to root module
  region              = var.region
  bucket_name         = var.bucket_name
  environment         = var.environment
  application_name    = var.application_name
  temporary           = var.temporary
  force_destroy       = var.force_destroy
  object_lock_enabled = var.object_lock_enabled
}

