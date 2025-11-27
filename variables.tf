# # This file defines all input variables for your Terraform configuration
# # Variables allow users to customize the deployment without modifying code

variable "bucket_name" {
  description = "Name of the S3 bucket to create."
  type        = string
}


variable "environment" {
  description = "Environment tag value in Azure"
  type        = string
  validation {
    condition     = contains(["DEV", "QA", "UAT", "PROD"], var.environment)
    error_message = "Environment value should be one among DEV or QA or UAT or PROD."
  }
}

variable "application_name" {
  description = "Azure application name tag"
  type        = string
}


variable "temporary" {
  description = "Temporary tag value in Azure"
  type        = string
  validation {
    condition     = contains(["TRUE", "FALSE"], upper(var.temporary))
    error_message = "The temporary tag value must be either 'TRUE' or 'FALSE'."
  }
}

variable "region" {
  description = "AWS region to deploy resources."
  type        = string
}

variable "force_destroy" {
  description = "Boolean that indicates all objects (including any locked objects) should be deleted from the bucket when the bucket is destroyed"
  type        = bool
}

variable "object_lock_enabled" {
  description = "Indicates whether this bucket has an Object Lock configuration enab"
  type        = bool
}