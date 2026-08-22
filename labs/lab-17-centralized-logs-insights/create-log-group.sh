#!/usr/bin/env bash
# Idempotently create a CloudWatch Logs log group.
# Usage: bash create-log-group.sh /devops/app
set -euo pipefail
LG="${1:?usage: create-log-group.sh <log-group-name>}"
PROFILE="${AWS_PROFILE:-devops}"

if aws logs describe-log-groups --log-group-name-prefix "$LG" \
     --query "logGroups[?logGroupName=='$LG'] | length(@)" --output text --profile "$PROFILE" | grep -qx 1; then
  echo "log group $LG already exists"
else
  aws logs create-log-group --log-group-name "$LG" --profile "$PROFILE"
  echo "log group $LG created"
fi
