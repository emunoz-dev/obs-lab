cd /root/prod/
terragrunt run-all init -upgrade --terragrunt-log-level debug
terragrunt run-all plan --terragrunt-log-level debug
terragrunt run-all apply --terragrunt-log-level debug
aws --endpoint-url=http://localstack:4566 cloudwatch describe-alarms |cat
exit
