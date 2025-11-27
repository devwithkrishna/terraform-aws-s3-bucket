# # Variables for the test configuration

variable "region" {
  description = "AWS region to deploy resources."
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket to create."
  type        = string
  default     = "devwithkrisha-s3-apsouth"
}

variable "environment" {
  description = "Environment tag (e.g., dev, prod)."
  type        = string
  default     = "DEV"
}

variable "application_name" {
  description = "Name of the application."
  type        = string
  default     = "devwithkrishna"
}

variable "temporary" {
  description = "Whether resource is temporary."
  type        = string
  default     = "TRUE"
}

variable "force_destroy" {
  default = true
}

variable "object_lock_enabled" {
  default = true
}