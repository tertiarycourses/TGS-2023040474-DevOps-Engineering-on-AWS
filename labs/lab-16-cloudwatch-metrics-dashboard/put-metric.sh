#!/usr/bin/env bash
# Publishes a small batch of application metrics so the dashboard has data to chart.
# Metrics: latency (ms), request count and error count in the DevOps/App namespace.
set -euo pipefail
NS="DevOps/App"
PROFILE="${AWS_PROFILE:-devops}"
SAMPLES="${1:-10}"

for i in $(seq 1 "$SAMPLES"); do
  latency=$(( (RANDOM % 250) + 50 ))          # 50..300 ms
  aws cloudwatch put-metric-data --namespace "$NS" \
    --metric-name LatencyMs --value "$latency" --unit Milliseconds --profile "$PROFILE"
  aws cloudwatch put-metric-data --namespace "$NS" \
    --metric-name RequestCount --value 1 --unit Count --profile "$PROFILE"
  if (( latency > 250 )); then
    aws cloudwatch put-metric-data --namespace "$NS" \
      --metric-name AppErrorCount --value 1 --unit Count --profile "$PROFILE"
  fi
done

echo "published $SAMPLES samples to $NS"
