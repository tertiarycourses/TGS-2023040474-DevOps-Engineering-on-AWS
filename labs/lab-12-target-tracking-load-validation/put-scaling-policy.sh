#!/usr/bin/env bash
# Attach the target-tracking scaling policy defined in scaling-policy.json.
# Usage: ./put-scaling-policy.sh   (uses the AWS_PROFILE from your environment)
set -euo pipefail
PROFILE="${AWS_PROFILE:-devops}"
aws autoscaling put-scaling-policy \
  --cli-input-json file://scaling-policy.json \
  --profile "${PROFILE}" \
  --query '{PolicyARN:PolicyARN,Alarms:Alarms[].AlarmName}'
echo "Policy attached. Two CloudWatch alarms (high/low) were created for target tracking."
