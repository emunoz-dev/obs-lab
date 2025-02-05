#!/usr/bin/env bash

# Get InstanceId of EC2
  EC2_ID=$(aws --endpoint-url=http://localstack:4566 ec2 describe-instances --query \
    "Reservations[*].Instances[*].InstanceId" | grep "i-" | cut -d '"' -f 2)

while true; do
  #Random value numbers
  dec=$(shuf -i 1-100 -n 1)
  flt=$(shuf -i 1-9 -n 1)

  # Create a fake metrics
  aws --endpoint-url=http://localstack:4566 cloudwatch put-metric-data \
      --metric-name CPUUtilization \
      --namespace EC2 \
      --dimensions InstanceId="${EC2_ID}" \
      --value "${dec}"."${flt}" \
      --unit Percent

  # Wait 15 seconds
  sleep 15
done