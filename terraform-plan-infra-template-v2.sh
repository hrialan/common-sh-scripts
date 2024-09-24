#!/bin/sh
cd iac/deploy-steps/1.infra/
terraform init -backend-config=../vars/backend/dv.tfvars -upgrade
terraform plan -var-file=../vars/tfvars/dv.tfvars
