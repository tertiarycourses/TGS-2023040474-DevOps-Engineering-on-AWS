#!/usr/bin/env bash
# Lab 2 - create (if needed) and verify a GitHub CodeConnections connection.
set -euo pipefail
PROFILE="${AWS_PROFILE:-devops}"
NAME="${CONNECTION_NAME:-devops-github}"

ARN="$(aws codeconnections list-connections --profile "$PROFILE" \
  --query "Connections[?ConnectionName=='${NAME}'].ConnectionArn | [0]" --output text)"

if [ "$ARN" = "None" ] || [ -z "$ARN" ]; then
  echo "Creating connection ${NAME} ..."
  ARN="$(aws codeconnections create-connection --provider-type GitHub \
    --connection-name "$NAME" --profile "$PROFILE" \
    --query 'ConnectionArn' --output text)"
  echo "Created: $ARN"
  echo "Now authorise the AWS Connector for GitHub in the console to move PENDING -> AVAILABLE."
fi

STATUS="$(aws codeconnections get-connection --connection-arn "$ARN" \
  --profile "$PROFILE" --query 'Connection.ConnectionStatus' --output text)"
echo "Connection: $ARN"
echo "Status:     $STATUS"
[ "$STATUS" = "AVAILABLE" ] && echo "CONNECTION OK" || echo "Not yet AVAILABLE - finish the browser handshake."
