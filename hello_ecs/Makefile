all: validate lint apply

validate:
	find . -type f -name '*.tf' -exec dirname {} \; \
        | sort -u \
        | xargs -I {} terraform validate {}

fmt:
	terraform fmt -recursive -check

plan:
	terraform plan

apply:
	terraform apply

lint:
	tflint --deep --aws-region=eu-west-3

destroy: validate lint
	terraform destroy
