#!/usr/bin/env bash
# Confirm the tier fully recovered: 2 InService instances and the ALB serving 200s.
# Usage: ALB_DNS=<alb-dns> ASG_NAME=devops-ha-asg ./verify-recovery.sh
set -euo pipefail
PROFILE="${AWS_PROFILE:-devops}"
ASG_NAME="${ASG_NAME:-devops-ha-asg}"
: "${ALB_DNS:?Set ALB_DNS to your load balancer DNS name}"
echo "== Auto Scaling group =="
aws autoscaling describe-auto-scaling-groups \
  --auto-scaling-group-names "${ASG_NAME}" \
  --query 'AutoScalingGroups[0].{Desired:DesiredCapacity,InService:length(Instances[?LifecycleState==`InService`])}' \
  --profile "${PROFILE}"
echo "== ALB response check (30 requests) =="
OK=0
for i in $(seq 30); do
  CODE=$(curl -s -o /dev/null -w '%{http_code}' "http://${ALB_DNS}/")
  [ "${CODE}" = "200" ] && OK=$((OK+1))
done
echo "${OK}/30 requests returned HTTP 200"
if [ "${OK}" -ge 29 ]; then
  echo "RECOVERED: tier is serving traffic normally."
else
  echo "WARN: still degraded, investigate target health."
fi
