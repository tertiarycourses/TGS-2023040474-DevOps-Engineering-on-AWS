#!/usr/bin/env bash
# Deploy StackSet instances to an OU across one or more Regions in a single op.
# Usage: bash deploy-stackset.sh <stackset-name> <ou-id> <region> [region...]
set -euo pipefail
NAME="${1:?stackset name required}"
OU="${2:?ou-id required}"
shift 2
REGIONS=("$@")
if [[ ${#REGIONS[@]} -eq 0 ]]; then
  echo "At least one region is required" >&2
  exit 1
fi
PROFILE="${AWS_PROFILE:-devops}"

echo "Deploying ${NAME} to OU ${OU} in regions: ${REGIONS[*]}"
OP=$(aws cloudformation create-stack-instances \
  --stack-set-name "$NAME" \
  --deployment-targets OrganizationalUnitIds="$OU" \
  --regions "${REGIONS[@]}" \
  --operation-preferences FailureToleranceCount=0,MaxConcurrentCount=1 \
  --query OperationId --output text --profile "$PROFILE")

echo "OperationId: $OP"
echo "Track with:"
echo "  aws cloudformation describe-stack-set-operation \\"
echo "    --stack-set-name ${NAME} --operation-id ${OP} \\"
echo "    --query StackSetOperation.Status --profile ${PROFILE}"
