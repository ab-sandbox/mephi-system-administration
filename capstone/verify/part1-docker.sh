#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CAPSTONE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "=== DOCKER IMAGE ==="
docker image ls resource-monitor:1.0

echo
echo "=== CONTAINER ==="
docker compose -f "$CAPSTONE_DIR/compose.yaml" ps

echo
echo "=== RESOURCE MONITOR ==="
docker exec resource-monitor tail -20 /var/www/monitor.log
