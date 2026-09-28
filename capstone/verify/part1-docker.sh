#!/usr/bin/env bash

set -e

echo "=== DOCKER IMAGE ==="
docker image ls resource-monitor:1.0

echo
echo "=== CONTAINER ==="
docker compose -f capstone/compose.yaml ps

echo
echo "=== RESOURCE MONITOR ==="
docker exec resource-monitor tail -20 /var/www/monitor.log
