#!/usr/bin/env bash
# Lab 5 - validate the deployed app is serving HTTP 200 and report its version.
set -euo pipefail
URL="${1:-http://localhost/}"
CODE="$(curl -s -o /tmp/app.html -w '%{http_code}' "$URL")"
echo "HTTP ${CODE} from ${URL}"
[ "$CODE" = "200" ] || { echo "Health check FAILED"; exit 1; }
grep -o 'Version:[^<]*' /tmp/app.html || true
echo "Health check OK"
