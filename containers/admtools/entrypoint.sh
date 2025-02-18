#!/usr/bin/env bash

# Init terragrunt and Terraform
terragrunt run-all init --terragrunt-log-level debug --terragrunt-working-dir /root/prod --terragrunt-non-interactive

# Plan TF
terragrunt run-all plan --terragrunt-log-level debug --terragrunt-working-dir /root/prod --terragrunt-non-interactive

# Apply TF
terragrunt run-all apply --terragrunt-log-level debug --terragrunt-working-dir /root/prod --terragrunt-non-interactive

# Create fake metrics
/root/containers/admtools/do_fk_metrics_aws.sh