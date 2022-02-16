#!/bin/bash
set -e

cd infrastructure/${ENV}/${REGION}

terraform init

if [[ "$BRANCH_NAME" == "main" ]] ; then
  terraform apply -auto-approve
else
  terraform plan
fi