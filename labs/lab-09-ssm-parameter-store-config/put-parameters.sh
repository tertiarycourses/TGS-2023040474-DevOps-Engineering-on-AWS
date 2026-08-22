#!/usr/bin/env bash
# Externalize non-sensitive app configuration into SSM Parameter Store.
# SecureString (password) is created separately so a real value is never scripted.
set -euo pipefail
PROFILE="${AWS_PROFILE:-devops}"

put () {
  aws ssm put-parameter --name "$1" --type "$2" --value "$3" \
    --overwrite --profile "$PROFILE" \
    --query '{Name:Name,Version:Version}' --output text
}

echo "Creating non-sensitive parameters..."
put /devops/app/log-level     String     INFO
put /devops/app/feature-flags StringList beta,newui
put /devops/app/db/endpoint   String     db.dev.internal:5432

echo "Done. Create the SecureString separately, e.g.:"
echo "  aws ssm put-parameter --name /devops/app/db/password --type SecureString \\"
echo "    --value '<your-own-value>' --key-id alias/aws/ssm --overwrite --profile ${PROFILE}"
