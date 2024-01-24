all:
	@echo "Available commands:"
	@echo "\tmake localstack-infra-up - Init and apply terraform to localstack"
	@echo "\tmake localstack-infra-down - Destroy terraform to localstack"
	@echo "\tmake aws-infra-up - Init and apply terraform to aws"
	@echo "\tmake aws-infra-down - Destroy terraform to aws"

localstack-infra-up: plan-and-apply-terraform-localstack
localstack-infra-down: destroy-terraform-localstack
aws-infra-up: plan-and-apply-terraform-aws
aws-infra-down: destroy-terraform-aws

# Terraform + Localstack
init-terraform-localstack:
	@echo "Init terraform"
	@AWS_PROFILE=localstack terraform -chdir=terraform/ init -upgrade=true

plan-and-apply-terraform-localstack: init-terraform-localstack
	@echo "Plan and apply terraform"
	@AWS_PROFILE=localstack terraform -chdir=terraform/ plan -out=tfplan
	@AWS_PROFILE=localstack terraform -chdir=terraform/ apply -auto-approve tfplan

destroy-terraform-localstack:
	@echo "Destroy localstack infra"
	@AWS_PROFILE=localstack terraform -chdir=terraform/ destroy -auto-approve

# Terraform + AWS
init-terraform-aws:
	@echo "Init terraform"
	@AWS_PROFILE=aws terraform -chdir=terraform/ init -upgrade=true

plan-and-apply-terraform-aws: init-terraform-aws
	@echo "Plan and apply terraform"
	@AWS_PROFILE=aws terraform -chdir=terraform/ plan -out=tfplan
	@AWS_PROFILE=aws terraform -chdir=terraform/ apply -auto-approve tfplan

destroy-terraform-aws:
	@echo "Destroy aws infra"
	@AWS_PROFILE=aws terraform -chdir=terraform/ destroy -auto-approve