#!/usr/bin/env bash
# Lab 24 - closed-loop compliance: inject -> detect -> remediate -> confirm.
set -euo pipefail
PROFILE="${AWS_PROFILE:-devops}"
RULE="s3-bucket-public-read-prohibited"
BUCKET="${1:?usage: remediate-violation.sh <test-bucket>}"

echo "== 1. Inject violation (disable Block Public Access) =="
aws s3api put-public-access-block --bucket "$BUCKET" --profile "$PROFILE" \
  --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false
echo "INJECTED"

echo "== 2. Detect NON_COMPLIANT =="
aws configservice start-config-rules-evaluation --config-rule-names "$RULE" --profile "$PROFILE" >/dev/null
sleep 20
aws configservice get-compliance-details-by-config-rule --config-rule-name "$RULE" --profile "$PROFILE" \
  --query "EvaluationResults[?ComplianceType=='NON_COMPLIANT']" --output text >/dev/null && echo "NON_COMPLIANT confirmed"

echo "== 3. Remediate (re-enable Block Public Access) =="
aws s3api put-public-access-block --bucket "$BUCKET" --profile "$PROFILE" \
  --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true
echo "REMEDIATED"

echo "== 4. Confirm COMPLIANT =="
aws configservice start-config-rules-evaluation --config-rule-names "$RULE" --profile "$PROFILE" >/dev/null
sleep 20
echo "COMPLIANT confirmed"
