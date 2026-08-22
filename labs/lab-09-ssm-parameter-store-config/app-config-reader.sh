#!/usr/bin/env bash
# Simulate an application loading its configuration from SSM Parameter Store
# at runtime. Non-sensitive values are read directly; the password is read
# with decryption and then masked in output.
set -euo pipefail
PROFILE="${AWS_PROFILE:-devops}"
PREFIX="/devops/app"

get () {
  aws ssm get-parameter --name "$1" ${2:-} \
    --query 'Parameter.Value' --output text --profile "$PROFILE"
}

LOG_LEVEL=$(get "$PREFIX/log-level")
FEATURE_FLAGS=$(get "$PREFIX/feature-flags")
DB_ENDPOINT=$(get "$PREFIX/db/endpoint")
DB_PASSWORD=$(get "$PREFIX/db/password" --with-decryption)

echo "LOG_LEVEL=$LOG_LEVEL"
echo "FEATURE_FLAGS=$FEATURE_FLAGS"
echo "DB_ENDPOINT=$DB_ENDPOINT"
# Never print the real secret - show only that it loaded.
echo "DB_PASSWORD=${DB_PASSWORD:0:1}******** (length ${#DB_PASSWORD})"
