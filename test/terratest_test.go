// Edit this file to add your own tests
// rename the file as <something>_test.go to be recognized by `go test` command.
// For more details, refer https://golang.org/pkg/testing/
package test

import (
	"os"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

// TestAwsCredentialsProvided verifies required AWS env vars for Terratest auth are set.
func TestAwsCredentialsProvided(t *testing.T) {

	required := []string{
		"AWS_ACCESS_KEY_ID",
		"AWS_SECRET_ACCESS_KEY",
	}

	for _, name := range required {
		val, ok := os.LookupEnv(name)
		require.Truef(t, ok && val != "", "environment variable %s must be set and non-empty", name)
	}
}

func GenerateRandomString() string {
	return random.UniqueId()
}

// TestTerraformModulePlaceholder is a placeholder for future Terratest integration tests.
// Replace the body with actual terraform.Options, InitAndApply, assertions, and defer Destroy.
func TestTerraformModulePlaceholder(t *testing.T) {
	t.Parallel()
	TestAwsCredentialsProvided(t)

	randomString := GenerateRandomString()
	t.Logf("Generated random string: %s", randomString)
	// 🔹 Step 1: Validate credentials first
	bucket := "awss3" + randomString
	t.Logf("Generated s3 bucket name: %s", bucket)

	terraformOptions := &terraform.Options{
		// Path to the example usage of the module
		TerraformDir: "../examples/sample",

		Vars: map[string]interface{}{
			"bucket_name": bucket,
		},

		// Retry settings: Azure sometimes needs extra time for provisioning
		MaxRetries:         3,
		TimeBetweenRetries: 10 * time.Second,
	}

	// ensure cleanup
	defer terraform.Destroy(t, terraformOptions)

	// init + apply
	terraform.InitAndApply(t, terraformOptions)

	// Fetch outputs
	bucketID := terraform.Output(t, terraformOptions, "bucket_id")
	bucketArn := terraform.Output(t, terraformOptions, "bucket_arn")
	bucketName := terraform.Output(t, terraformOptions, "s3_bucket_name")
	bucketRegion := terraform.Output(t, terraformOptions, "s3_bucket_region")
	bucketDomain := terraform.Output(t, terraformOptions, "s3_bucket_domain_fqdn")
	bucketTags := terraform.OutputMap(t, terraformOptions, "s3_tags")

	// basic assertions
	// 1. Bucket must exist in AWSap-south-1
	actualRegion := "ap-south-1"
	assert.Equal(t, bucketRegion, actualRegion, "Bucket region does not match expected region")

	// 2. Bucket ARN should not be empty
	assert.NotEmpty(t, bucketArn, "Bucket ARN output should not be empty")

	// 3. Bucket ID should match bucket name (for S3 they are identical)
	assert.Equal(t, bucketName, bucketID, "Bucket ID should equal bucket name")

	// 4. FQDN check: "<bucket>.s3.<region>.amazonaws.com"
	expectedDomain := bucketName + ".s3" + ".amazonaws.com"
	assert.Equal(t, expectedDomain, bucketDomain, "Bucket domain FQDN mismatch")
	// assert.True(t, publicAccessOut, "Expected public access to be enabled")

	// 5. Check that required tags exist
	assert.Contains(t, bucketTags, "Environment", "Expected tag 'Environment' to be present")
	assert.Contains(t, bucketTags, "ApplicationName", "Expected tag 'ApplicationName' to be present")

	// Optional: Check tag values
	assert.Equal(t, "DEV", bucketTags["Environment"], "Expected environment=DEV")

}
