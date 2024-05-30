#!/bin/bash
read -p "Environment?:" environment
read -p "Action apply or destroy?:" action
perl -pi -e "s/_env_/${environment}/g" backend.tf


terraform init -reconfigure
terraform plan -var-file=configs/${environment}.tfvars
terraform fmt
terraform validate

if [${action} == "apply" ]; then
terraform apply -var-file=configs/${environment}.tfvars --auto-approve
elif [${action} == "destroy" ]; then
terraform destroy -var-file=configs/${environment}.tfvars --auto-approve
fi

perl -pi -e "s/${environment}/_env_/g" backend.tf


