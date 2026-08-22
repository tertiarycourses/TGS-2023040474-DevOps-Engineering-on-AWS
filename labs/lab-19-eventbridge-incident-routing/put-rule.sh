#!/usr/bin/env bash
# Lab 19 - create/refresh the EventBridge incident-routing rule and its two targets.
# Usage: TOPIC_ARN=<arn> ./put-rule.sh   (run with AWS_PROFILE=devops or append --profile devops)
set -euo pipefail

PROFILE="${AWS_PROFILE:-devops}"
REGION="${AWS_REGION:-ap-southeast-1}"
ACCOUNT_ID="$(aws sts get-caller-identity --profile "$PROFILE" --query Account --output text)"
TOPIC_ARN="${TOPIC_ARN:-arn:aws:sns:${REGION}:${ACCOUNT_ID}:devops-incidents}"
LOG_ARN="arn:aws:logs:${REGION}:${ACCOUNT_ID}:log-group:/devops/incidents"

# 1. Validate the pattern before touching anything.
aws events test-event-pattern \
  --event-pattern file://event-pattern.json \
  --event file://sample-alarm-event.json \
  --profile "$PROFILE"

# 2. Create/refresh the rule.
aws events put-rule \
  --name devops-incident \
  --event-pattern file://event-pattern.json \
  --state ENABLED \
  --description "Route CloudWatch/EC2/Config incidents" \
  --profile "$PROFILE"

# 3. Attach both targets (notify + audit).
aws events put-targets \
  --rule devops-incident \
  --targets "Id=notify,Arn=${TOPIC_ARN}" "Id=audit,Arn=${LOG_ARN}" \
  --profile "$PROFILE"

echo "Rule devops-incident created with targets: notify (${TOPIC_ARN}) and audit (${LOG_ARN})."
