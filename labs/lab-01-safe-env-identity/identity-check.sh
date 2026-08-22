#!/usr/bin/env bash
# Lab 1 - verify the devops workspace is safe to use. No secrets are printed.
set -euo pipefail
PROFILE="${AWS_PROFILE:-devops}"

echo "== Caller identity =="
aws sts get-caller-identity --profile "$PROFILE" \
  --query '{Account:Account,Arn:Arn}' --output table

echo "== Active region =="
REGION="$(aws configure get region --profile "$PROFILE")"
echo "Region: ${REGION:-<unset>}"
[ -n "${REGION:-}" ] || { echo "ERROR: no region set for profile $PROFILE"; exit 1; }

echo "== Secret scan (tracked files) =="
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  if git grep -nE 'AKIA[0-9A-Z]{16}' >/dev/null 2>&1; then
    echo "ERROR: possible AWS access key committed!"; exit 1
  fi
fi

echo "PROFILE OK"
