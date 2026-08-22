#!/usr/bin/env bash
# Manually terminate ONE instance in the Auto Scaling group to test self-healing,
# then wait and report whether the group launched a replacement.
# Usage: ASG_NAME=devops-ha-asg ./inject-failure.sh
set -euo pipefail
PROFILE="${AWS_PROFILE:-devops}"
ASG_NAME="${ASG_NAME:-devops-ha-asg}"
ID=$(aws autoscaling describe-auto-scaling-groups \
  --auto-scaling-group-names "${ASG_NAME}" \
  --query 'AutoScalingGroups[0].Instances[0].InstanceId' \
  --output text --profile "${PROFILE}")
echo "Terminating ${ID} (desired capacity preserved)..."
aws autoscaling terminate-instance-in-auto-scaling-group \
  --instance-id "${ID}" \
  --no-should-decrement-desired-capacity \
  --profile "${PROFILE}"
echo "Waiting 120s for the group to launch a replacement..."
sleep 120
aws autoscaling describe-auto-scaling-groups \
  --auto-scaling-group-names "${ASG_NAME}" \
  --query 'AutoScalingGroups[0].Instances[].{Id:InstanceId,State:LifecycleState}' \
  --profile "${PROFILE}"
