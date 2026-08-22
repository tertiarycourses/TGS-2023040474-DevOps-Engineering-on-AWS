#!/usr/bin/env bash
# Subscribe an on-call email address to the alerts SNS topic.
# Usage: bash subscribe.sh you@example.com <topic-arn>
set -euo pipefail
EMAIL="${1:?usage: subscribe.sh <email> <topic-arn>}"
TOPIC_ARN="${2:?usage: subscribe.sh <email> <topic-arn>}"
PROFILE="${AWS_PROFILE:-devops}"

aws sns subscribe \
  --topic-arn "$TOPIC_ARN" \
  --protocol email \
  --notification-endpoint "$EMAIL" \
  --profile "$PROFILE" >/dev/null

echo "confirmation email sent to $EMAIL - click the link to confirm the subscription"
