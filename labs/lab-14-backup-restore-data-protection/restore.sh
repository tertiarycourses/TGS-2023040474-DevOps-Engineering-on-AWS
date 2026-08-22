#!/usr/bin/env bash
# Restore the most recent COMPLETED recovery point from the backup vault.
# Usage: VAULT=devops-vault ROLE_ARN=<backup-role-arn> ./restore.sh
set -euo pipefail
PROFILE="${AWS_PROFILE:-devops}"
VAULT="${VAULT:-devops-vault}"
: "${ROLE_ARN:?Set ROLE_ARN to the AWS Backup service role ARN}"
RP=$(aws backup list-recovery-points-by-backup-vault \
  --backup-vault-name "${VAULT}" \
  --query 'RecoveryPoints[?Status==`COMPLETED`]|[0].RecoveryPointArn' \
  --output text --profile "${PROFILE}")
echo "Restoring recovery point: ${RP}"
aws backup start-restore-job \
  --recovery-point-arn "${RP}" \
  --iam-role-arn "${ROLE_ARN}" \
  --metadata file://restore-metadata.json \
  --profile "${PROFILE}"
echo "Restore job started. Poll with: aws backup list-restore-jobs --profile ${PROFILE}"
