#!/usr/bin/env bash

set -e

echo "=== TEST REQUEST ==="
curl -ks https://127.0.0.1/monitor.log > /dev/null
echo "HTTPS request completed"

echo
echo "=== SYSTEMD SERVICE ==="
systemctl status resource-monitor --no-pager

echo
echo "=== APPLICATION JOURNAL ==="
sudo journalctl -u resource-monitor -n 5 --no-pager
