[![terraform-lint](https://github.com/devwithkrishna/terraform-aws-s3-bucket/actions/workflows/terraform-lint.yml/badge.svg)](https://github.com/devwithkrishna/terraform-aws-s3-bucket/actions/workflows/terraform-lint.yml)
[![go](https://github.com/devwithkrishna/terraform-aws-s3-bucket/actions/workflows/go.yml/badge.svg)](https://github.com/devwithkrishna/terraform-aws-s3-bucket/actions/workflows/go.yml)
[![update-readme](https://github.com/devwithkrishna/terraform-aws-s3-bucket/actions/workflows/update-readme.yml/badge.svg)](https://github.com/devwithkrishna/terraform-aws-s3-bucket/actions/workflows/update-readme.yml)
[![create-release](https://github.com/devwithkrishna/terraform-aws-s3-bucket/actions/workflows/release.yml/badge.svg)](https://github.com/devwithkrishna/terraform-aws-s3-bucket/actions/workflows/release.yml)
[![auto-fill-readme](https://github.com/devwithkrishna/terraform-aws-s3-bucket/actions/workflows/auto-fill-readme.yml/badge.svg)](https://github.com/devwithkrishna/terraform-aws-s3-bucket/actions/workflows/auto-fill-readme.yml)

# terraform-aws-s3-bucket

## Examples

Please find the [examples]((https://github.com/devwithkrishna/terraform-aws-s3-bucket/tree/main/examples)) here 

## 📂 Structure

<!-- BEGIN_REPO_TREE -->
```
.
├── .gitignore
├── CODEOWNERS
├── LICENSE
├── Makefile
├── README.md
├── docs
│   └── contributing.md
├── examples
│   └── sample
│       ├── main.tf
│       ├── outputs.tf
│       ├── providers.tf
│       └── variables.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── test
│   ├── README.md
│   ├── go.mod
│   ├── go.sum
│   └── terratest_test.go
└── variables.tf

5 directories, 18 files
```
<!-- END_REPO_TREE -->


## Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | Azure application name tag | `string` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the S3 bucket to create. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment tag value in Azure | `string` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Boolean that indicates all objects (including any locked objects) should be deleted from the bucket when the bucket is destroyed | `bool` | n/a | yes |
| <a name="input_object_lock_enabled"></a> [object\_lock\_enabled](#input\_object\_lock\_enabled) | Indicates whether this bucket has an Object Lock configuration enab | `bool` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region to deploy resources. | `string` | n/a | yes |
| <a name="input_temporary"></a> [temporary](#input\_temporary) | Temporary tag value in Azure | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | ARN of the bucket |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | s3 bucket id |
| <a name="output_s3_bucket_domain_fqdn"></a> [s3\_bucket\_domain\_fqdn](#output\_s3\_bucket\_domain\_fqdn) | s3 bucket fqdn |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | s3 bucket name |
| <a name="output_s3_bucket_region"></a> [s3\_bucket\_region](#output\_s3\_bucket\_region) | Account on which s3 bucket is created |
| <a name="output_s3_tags"></a> [s3\_tags](#output\_s3\_tags) | S3 bucket tags |
<!-- END_TF_DOCS -->


## How to generate this README

This README section is automatically generated using [terraform-docs](https://terraform-docs.io/) a powerful documentation generator for Terraform modules.

It parses your module’s variables, outputs, providers, and resources to produce consistent and up-to-date Markdown documentation directly inside your README file.

Execute below to generate latest docs

```bash
terraform-docs markdown table --output-file README.md --output-mode inject .
```


#### This repository is maintained by devwithkrishna.
