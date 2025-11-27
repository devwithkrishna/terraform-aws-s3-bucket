# Makefile for cleaning Terraform local files

.PHONY: clean clean-all fmt

# Delete Terraform working directory + local state + lock files
clean:
	@echo "🧹 Cleaning local Terraform files..."
	@find . -type d -name ".terraform" -prune -exec rm -rf {} +
	@find . -maxdepth 1 -type f -name "terraform.tfstate" -delete
	@find . -maxdepth 1 -type f -name "terraform.tfstate.backup" -delete
	@find . -maxdepth 1 -type f -name "*.out" -delete
	@find . -maxdepth 1 -type f -name "*.hcl" -delete
	@echo "✔ Done."

# Delete ALL state files even in nested module/example folders
clean-all:
	@echo "🔥 Deep cleaning ALL Terraform artifacts recursively..."
	@find . -type d -name ".terraform" -prune -exec rm -rf {} +
	@find . -type f -name "*.tfstate" -delete
	@find . -type f -name "*.tfstate.backup" -delete
	@find . -type f -name "*.out" -delete
	@find . -type f -name "*.hcl" -delete
	@echo "✔ Deep clean complete."

fmt:
	@echo "Applying Terraform fmt recursively..."
	terraform fmt --recursive