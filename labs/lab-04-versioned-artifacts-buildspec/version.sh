#!/usr/bin/env bash
# Lab 4 - compute a commit/semver artifact name and package the app locally.
set -euo pipefail
APP_NAME="${APP_NAME:-devops-sample-app}"
SEMVER="$(python3 -c 'from app.version import VERSION; print(VERSION)')"
SHA="$(git rev-parse --short=7 HEAD 2>/dev/null || echo local00)"
ARTIFACT="${APP_NAME}-${SEMVER}-${SHA}.zip"

mkdir -p dist
rm -f "dist/${ARTIFACT}"
zip -qr "dist/${ARTIFACT}" app -x '*/__pycache__/*'
echo "Built dist/${ARTIFACT}"
