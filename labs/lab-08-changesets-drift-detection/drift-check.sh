#!/usr/bin/env bash
# Detect drift on a stack and report the result.
# Usage: bash drift-check.sh <stack-name>
set -euo pipefail
STACK="${1:?stack name required}"
PROFILE="${AWS_PROFILE:-devops}"

ID=$(aws cloudformation detect-stack-drift --stack-name "$STACK" \
      --query StackDriftDetectionId --output text --profile "$PROFILE")
echo "Detection started: $ID"

STATUS="DETECTION_IN_PROGRESS"
while [[ "$STATUS" == "DETECTION_IN_PROGRESS" ]]; do
  sleep 5
  STATUS=$(aws cloudformation describe-stack-drift-detection-status \
            --stack-drift-detection-id "$ID" \
            --query DetectionStatus --output text --profile "$PROFILE")
done

DRIFT=$(aws cloudformation describe-stack-drift-detection-status \
          --stack-drift-detection-id "$ID" \
          --query StackDriftStatus --output text --profile "$PROFILE")
echo "StackDriftStatus: $DRIFT"
