#!/usr/bin/env bash
# Lab 22 - demonstrate KMS encrypt/decrypt and the deny-unencrypted S3 guardrail.
set -euo pipefail
PROFILE="${AWS_PROFILE:-devops}"
BUCKET="${DATA_BUCKET:?set DATA_BUCKET=devops-sample-app-data-<your-account-id>}"
KEY="alias/devops-app"

echo "== 1. Unencrypted upload MUST be denied =="
if aws s3api put-object --bucket "$BUCKET" --key plain.txt --body ./report.json --profile "$PROFILE" 2>/dev/null; then
  echo "FAIL: unencrypted upload was allowed"; exit 1
else
  echo "OK: unencrypted upload denied"
fi

echo "== 2. SSE-KMS upload MUST succeed =="
aws s3api put-object --bucket "$BUCKET" --key report.json --body ./report.json \
  --server-side-encryption aws:kms --ssekms-key-id "$KEY" --profile "$PROFILE" \
  --query '{SSE:ServerSideEncryption}' --output text
echo "OK: SSE-KMS upload succeeded"

echo "== 3. KMS encrypt/decrypt round-trip =="
aws kms encrypt --key-id "$KEY" --plaintext fileb://report.json \
  --query CiphertextBlob --output text --profile "$PROFILE" | base64 --decode > report.enc
aws kms decrypt --ciphertext-blob fileb://report.enc \
  --query Plaintext --output text --profile "$PROFILE" | base64 --decode | head -c 40
echo ""
echo "ROUND-TRIP OK"
