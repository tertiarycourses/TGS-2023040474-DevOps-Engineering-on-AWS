#!/usr/bin/env bash
# Lab 23 - bundle a targeted CloudTrail lookup and write a dated evidence file.
set -euo pipefail
PROFILE="${AWS_PROFILE:-devops}"
EVENT="${EVENT_NAME:-RunInstances}"
OUT="evidence-$(date +%Y%m%d).json"
mkdir -p evidence

echo "== lookup-events for ${EVENT} =="
aws cloudtrail lookup-events --profile "$PROFILE" \
  --lookup-attributes AttributeKey=EventName,AttributeValue="$EVENT" \
  --max-results 25 \
  --query 'Events[].{Time:EventTime,User:Username,Event:EventName,Resources:Resources}' \
  --output json | tee "evidence/${OUT}"

echo ""
echo "Wrote evidence/${OUT}"
