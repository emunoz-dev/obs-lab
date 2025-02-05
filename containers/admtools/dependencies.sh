#!/usr/bin/env bash

apt update
apt -y install wget curl unzip gpg

## Terraform
wget -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
. /etc/os-release
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(echo ${VERSION_CODENAME}) main" | tee /etc/apt/sources.list.d/hashicorp.list
apt update
apt -y install terraform # <= 9.7 Does not work properly with terragrunt, has a bug. Version >= 10.2 works.

## AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip /tmp/awscliv2.zip -d /tmp/
/tmp/aws/install

## Terragrunt
wget -O "/usr/local/bin/terragrunt" "https://github.com/gruntwork-io/terragrunt/releases/download/v0.69.3/terragrunt_linux_amd64"
chmod 555 /usr/local/bin/terragrunt

