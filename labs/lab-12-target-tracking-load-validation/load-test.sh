#!/usr/bin/env bash
# Generate sustained CPU load on the LOCAL instance to force Auto Scaling scale-out.
# Run this ON an instance in the group (e.g. via SSM Session Manager).
# Usage: DURATION=600 WORKERS=4 ./load-test.sh
set -euo pipefail
DURATION="${DURATION:-600}"
WORKERS="${WORKERS:-4}"
echo "Spawning ${WORKERS} CPU workers for ${DURATION}s..."
PIDS=()
for _ in $(seq "${WORKERS}"); do
  yes > /dev/null &
  PIDS+=("$!")
done
sleep "${DURATION}"
for p in "${PIDS[@]}"; do kill "${p}" 2>/dev/null || true; done
echo "Load stopped. The group should now scale back in toward MinSize."
