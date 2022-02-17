#!/bin/bash
set -e

ENV=$1
REGION=$2

cd infrastructure/${ENV}/${REGION}

terraform init

if [[ "$BRANCH_NAME" == "main" ]] ; then
  terraform apply -auto-approve
else
  terraform plan
fi
