# Solution
The purpose of this code is to share the Terragrunt and Terraform code to create an observability lab in Localstack (AWS emulator in local). The laboratory contains code with different examples that can will be used in production scenarios.
## Requirements
- Podman >= 3.4.2
- Podman-compose >= 1.0.3

## docker-compose.yml
- In my case i use 'podman-compose' because its safety and performance than 'docker-compose' 
- For security only need to enable and expose the 'podman API socket' taking advantage of the native 
  features of 'rootless' in 'Podman'. It is required to run inside physical system native:
```bash
# Execute with anybody "rootless" user
systemctl --user start podman.socket
```
- Terraform and Terragrunt require fake credentials. Export fake credentials inside the 'admtools' container


## Terragrunt & Terraform
### Fix of code to enable properly execution
- The endpoints are name of the container and it is pointed to the internal service ports for localstack
  [For more information about it.](https://docs.localstack.cloud/references/external-ports/)
- Disabled the resource s3 because has a problem with fake credentials and blocks modules execution. It is recommended to upload the tfstate to s3 if working in team.
- Created especific directorys for each Terraform module and Terragrunt module.
- changed how it runs Terraform modules, now works with dependencies and dependency of Terragrunt 
syntaxies. EC2 requiere an output from terraform VPC module.
- From admtools container, move into directory '/root/prod' and execute:
```bash
# /root/prod/
terragrunt run-all init --terragrunt-log-level debug
##If is necessary reset init:
terragrunt run-all init -upgrade --terragrunt-log-level debug
##Then plan and apply
terragrunt run-all plan --terragrunt-log-level debug
terragrunt run-all apply --terragrunt-log-level debug
```
- checks after execute
```bash
# If enable S3 resource in "/root/terragrunt.hcl": 
aws --endpoint-url=http://localstack:4566 s3 ls
# Check ec2 resource in localstack
aws --endpoint-url=http://localstack:4566 ec2 describe-instances
aws --endpoint-url=http://localstack:4566 ec2 describe-subnets
```