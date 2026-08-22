#!/usr/bin/env bash
# Hit the load balancer repeatedly and count distinct responders.
# Usage: ALB_DNS=<alb-dns-name> ./smoke-test.sh
set -euo pipefail
: "${ALB_DNS:?Set ALB_DNS to your load balancer DNS name}"
COUNT="${COUNT:-20}"
echo "Sending ${COUNT} requests to http://${ALB_DNS}/ ..."
for i in $(seq "${COUNT}"); do
  curl -s "http://${ALB_DNS}/"
  echo
done | sort | uniq -c
echo "If two or more distinct 'OK from ip-...' lines appear, both AZs are serving traffic."
