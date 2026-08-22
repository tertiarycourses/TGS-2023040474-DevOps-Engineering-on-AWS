#!/usr/bin/env bash
# Bootstraps a tiny web server that returns the instance hostname, proving load
# balancing across Availability Zones. This mirrors the UserData in ha-asg.yaml
# so you can test the bootstrap manually on a throwaway instance if you wish.
set -euo pipefail
dnf install -y httpd
echo "OK from $(hostname)" > /var/www/html/index.html
systemctl enable --now httpd
