#!/usr/bin/env bash
# Lab 25 - confirm every learning outcome has a present, non-empty evidence artifact.
set -euo pipefail
ROOT="${EVIDENCE_ROOT:-evidence}"
declare -A DOMAINS=(
  [LO1]="01-sdlc" [LO2]="02-iac" [LO3]="03-resilience"
  [LO4]="04-observability" [LO5]="05-response" [LO6]="06-security"
)
FAIL=0
for LO in LO1 LO2 LO3 LO4 LO5 LO6; do
  DIR="${ROOT}/${DOMAINS[$LO]}"
  if [ -d "$DIR" ] && [ -n "$(find "$DIR" -type f -size +0c 2>/dev/null | head -n1)" ]; then
    echo "${LO} OK  (${DIR})"
  else
    echo "${LO} MISSING evidence in ${DIR}"; FAIL=1
  fi
done
if [ "$FAIL" -eq 0 ]; then
  echo "EVIDENCE PACK COMPLETE"
else
  echo "EVIDENCE PACK INCOMPLETE"; exit 1
fi
