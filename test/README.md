# Terratest - Minimal Quickstart

### Prerequisites
- Go 1.18+ installed
- Terraform CLI installed
- Cloud credentials for the provider you test (see examples below)
- Internet access for provider plugins

### Initialize the test module
1. Open a terminal in the test/ folder. [Remove the `go.mod` and `go.sum` files already existing]
2. Initialize the Go module (replace module path):
   - Example:
    ```
     go mod init github.com/devwithkrishna/terraform-aws-s3-bucket/test
    ```

### Install test dependencies (example)
- Add terratest and testify, run:

  ```bash
    go get github.com/gruntwork-io/terratest/modules/terraform
    go get github.com/stretchr/testify/assert
  ```

  Once these are executed `go.mod` and `go.sum` will be created with details
  
- Create test go file with name ending with_test.go.

### Run tests

- From test folder:
  
  ```bash
    cd test
  ```

  ```bash
    go test -v -timeout 30m
  ```

### Environment variables

- Provider credential examples:


  Azure (PowerShell / Bash)
  - PowerShell:
  ```bash
    $env:ARM_CLIENT_ID = "..."
    $env:ARM_CLIENT_SECRET = "..."
    $env:ARM_SUBSCRIPTION_ID = "..."
    $env:ARM_TENANT_ID = "..."
  ```
  - Bash:
  ```bash
    export ARM_CLIENT_ID="your-client-id"
    export ARM_CLIENT_SECRET="your-client-secret"
    export ARM_SUBSCRIPTION_ID="your-subscription-id"
    export ARM_TENANT_ID="your-tenant-id"
  ```
### Notes / Best practices (brief)
- Use unique names (timestamps/random suffix) to avoid collisions.
- Always call terraform.Destroy in tests (defer) to clean up.
- Do not commit secrets.

