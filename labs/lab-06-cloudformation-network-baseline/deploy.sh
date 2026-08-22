#!/usr/bin/env bash
# Deploy the reusable network baseline for a given environment.
# Usage: bash deploy.sh <dev|test>
set -euo pipefail
ENV="${1:-dev}"
PROFILE="${AWS_PROFILE:-devops}"
PARAMS="parameters-${ENV}.json"
if [[ ! -f "$PARAMS" ]]; then
  echo "Parameter file $PARAMS not found" >&2
  exit 1
fi
echo "Deploying net-${ENV}..."
# Convert the JSON param file into --parameter-overrides K=V pairs.
OVERRIDES=$(python3 -c "import json;print(' '.join(f\"{p['ParameterKey']}={p['ParameterValue']}\" for p in json.load(open('$PARAMS'))))")
aws cloudformation deploy \
  --template-file network.yaml \
  --stack-name "net-${ENV}" \
  --parameter-overrides $OVERRIDES \
  --tags Project=devops-course Lab=06 Environment="${ENV}" \
  --profile "$PROFILE"
echo "Done. Exports:"
aws cloudformation list-exports \
  --query "Exports[?starts_with(Name,'${ENV}-')].{Name:Name,Value:Value}" \
  --profile "$PROFILE"
