APP_NAME=nodeapp
IMAGE_TAG=v1
ACR_NAME=myacrregistry

# Docker Commands
docker-build:
	docker build -t $(ACR_NAME).azurecr.io/$(APP_NAME):$(IMAGE_TAG) ./app

docker-push:
	az acr login --name $(ACR_NAME)
	docker push $(ACR_NAME).azurecr.io/$(APP_NAME):$(IMAGE_TAG)

# Terraform Commands
tf-init:
	cd terraform && terraform init

tf-validate:
	cd terraform && terraform validate

tf-plan:
	cd terraform && terraform plan -var-file="terraform.tfvars"

tf-apply:
	cd terraform && terraform apply -auto-approve -var-file="terraform.tfvars"

# Azure DevOps Pipeline Helper
pipeline-run:
	az pipelines run --name "CI-CD-Pipeline"
