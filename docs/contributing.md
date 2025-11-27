# Terraform Module Development and CI

Workload repositories consume co-developed Terraform modules that undergo a comprehensive testing and release pipeline before being published to a terraform registry. This ensures that all modules are reliable, secure, and adhere to our modern standards.

## 🧩 Development Workflow

The development process for a new or updated Terraform module follows these key stages:

1. **Branching**: All changes start on a feature branch, typically named feature/short-description.

2. **Development**: The developer makes the required changes to the Terraform code (.tf files), updates or adds examples in the examples/ directory, and writes corresponding tests in the test/ directory.

3. **Pull Request**: A pull request is opened to merge the feature branch into main. This triggers a series of automated CI workflows.

## ⚙️ CI Pipeline

The CI pipeline is a set of GitHub Actions workflows designed to validate, test, secure, and release the module before it can be merged and released.

|Workflow |	Description|
|---------|------------|
|Terratest |Executes Go-based Terratest suites located in the test/ directory to perform integration testing on the module’s examples.|


If all checks pass, the PR can be reviewed and merged into the main branch.

## 🚀 Release and Publication

Once a PR is merged, the release process is triggered automatically:

*  **Release Workflow**: On a push to main, the Release workflow is initiated. It uses `devwithkrishna/devwithkrishna-create-release-action` to automate semantic versioning and tagging based on labels.

    | labels | description | example|
    |--------|-------------|--------|
    |  first-release | first release on repository | 1.0.0 |
    | major | major semantic version changes | 1.0.1 --> 2.0.0 |
    | minor | minor semantic version changes | 1.1.3 --> 1.2.0 |
    | patch | patch semantic version changes | 1.1.3 --> 1.1.4 |


**Workload repositories can then consume the new module version by updating their source and version arguments.**