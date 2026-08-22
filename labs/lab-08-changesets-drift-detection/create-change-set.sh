#!/usr/bin/env bash
# Create and summarise a change set that previews app-v2.yaml against a stack.
# Usage: bash create-change-set.sh <stack-name> <change-set-name>
set -euo pipefail
STACK="${1:?stack name required}"
CS="${2:?change set name required}"
PROFILE="${AWS_PROFILE:-devops}"

echo "Creating change set ${CS} for ${STACK}..."
aws cloudformation create-change-set \
  --stack-name "$STACK" \
  --change-set-name "$CS" \
  --template-body file://app-v2.yaml \
  --parameters ParameterKey=EnvName,ParameterValue=dev \
               ParameterKey=InstanceSize,ParameterValue=medium \
               ParameterKey=DeployMode,ParameterValue=single \
  --capabilities CAPABILITY_NAMED_IAM \
  --profile "$PROFILE" >/dev/null

echo "Waiting for change set to be created..."
aws cloudformation wait change-set-create-complete \
  --stack-name "$STACK" --change-set-name "$CS" --profile "$PROFILE"

echo "Preview of changes:"
aws cloudformation describe-change-set \
  --stack-name "$STACK" --change-set-name "$CS" \
  --query 'Changes[].ResourceChange.{Action:Action,Resource:LogicalResourceId,Replace:Replacement}' \
  --output table --profile "$PROFILE"
