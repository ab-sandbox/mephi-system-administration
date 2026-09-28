#!/usr/bin/env bash

set -e

echo "=== NGINX CONFIG ==="
sudo nginx -t

echo
echo "=== HTTP -> HTTPS ==="
curl -I http://127.0.0.1/monitor.log

echo
echo "=== HTTPS ==="
curl -kI https://127.0.0.1/monitor.log
