// https://github.com/terraform-linters/tflint/blob/master/docs/user-guide/config.md

tflint {
  required_version = ">= 0.50"
}

plugin "terraform" {
  enabled = true
  preset  = "recommended"
}
// for microsoft azure
plugin "aws" {
    enabled = true
    version = "0.28.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}
