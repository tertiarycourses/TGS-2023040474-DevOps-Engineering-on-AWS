#!/usr/bin/env bash
# Lab 21 - analyse the app policy for over-permissive / unused access. No secrets printed.
set -euo pipefail
PROFILE="${AWS_PROFILE:-devops}"
POLICY_FILE="iam-policy.json"
ANALYZER_ARN="${ANALYZER_ARN:-<analyzer-arn>}"

echo "== Access Analyzer policy validation =="
WARN=$(aws accessanalyzer validate-policy \
  --policy-document "file://${POLICY_FILE}" --policy-type IDENTITY_POLICY \
  --query "length(findings[?findingType=='SECURITY_WARNING'])" --output text --profile "$PROFILE")
[ "$WARN" = "0" ] && echo "VALIDATION: clean" || { echo "VALIDATION: $WARN security warnings"; exit 1; }

echo "== What-if: required write must be ALLOWED =="
aws iam simulate-custom-policy --profile "$PROFILE" \
  --policy-input-list "file://${POLICY_FILE}" \
  --action-names s3:PutObject \
  --resource-arns arn:aws:s3:::devops-sample-app-data/report.json \
  --query 'EvaluationResults[0].EvalDecision' --output text | sed 's/^/ALLOW put: /'

echo "== What-if: over-broad action must be DENIED =="
aws iam simulate-custom-policy --profile "$PROFILE" \
  --policy-input-list "file://${POLICY_FILE}" \
  --action-names s3:DeleteBucket \
  --resource-arns arn:aws:s3:::any-other-bucket \
  --query 'EvaluationResults[0].EvalDecision' --output text | sed 's/^/DENY delete: /'

echo "== External-access findings =="
if [ "$ANALYZER_ARN" != "<analyzer-arn>" ]; then
  N=$(aws accessanalyzer list-findings --analyzer-arn "$ANALYZER_ARN" \
      --query 'length(findings[?status==`ACTIVE`])' --output text --profile "$PROFILE")
  echo "EXTERNAL FINDINGS: ${N}"
else
  echo "EXTERNAL FINDINGS: (set ANALYZER_ARN to check)"
fi
