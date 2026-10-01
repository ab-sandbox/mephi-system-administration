#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CAPSTONE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_DIR="$(cd "$CAPSTONE_DIR/.." && pwd)"

section() {
    echo
    echo "============================================================"
    echo "$1"
    echo "============================================================"
}

section "1. GIT REPOSITORY"

if git -C "$REPO_DIR" rev-parse --git-dir > /dev/null 2>&1; then
    git -C "$REPO_DIR" log --oneline -10
else
    echo "Git repository metadata is not available in this deployment copy."
    echo "Run 'git log --oneline' in the source repository on the development host."
fi

section "2. RESOURCE MONITOR"

echo "Script:"
ls -l "$REPO_DIR/module-02/resource-monitor/script.sh"

echo
echo "Running process:"
docker exec resource-monitor pgrep -af script.sh

echo
echo "Latest monitoring data:"
docker exec resource-monitor tail -25 /var/www/monitor.log


section "3. DOCKER"

echo "Image:"
docker image ls resource-monitor:1.0

echo
echo "Container:"
docker compose -f "$CAPSTONE_DIR/compose.yaml" ps


section "4. RAID 1 AND LVM"

echo "RAID:"
cat /proc/mdstat

echo
echo "Volume groups:"
sudo vgs

echo
echo "Logical volumes:"
sudo lvs

echo
echo "Mounted filesystems:"
df -h /mnt/raid1 /mnt/lvm


section "5. NGINX REVERSE PROXY"

sudo nginx -t


section "6. TLS"

echo "HTTP redirect:"
curl -I http://127.0.0.1/monitor.log

echo
echo "HTTPS response:"
curl -kI https://127.0.0.1/monitor.log


section "7. SYSTEMD SERVICE"

echo "Enabled:"
systemctl is-enabled resource-monitor

echo
echo "Status:"
systemctl status resource-monitor --no-pager


section "8. LOGS"

echo "Generating a fresh HTTPS request..."
curl -ks https://127.0.0.1/monitor.log > /dev/null
sleep 1

echo
echo "Application journal:"
sudo journalctl -u resource-monitor -n 10 --no-pager

echo
echo "Nginx access log:"
sudo tail -n 5 /var/log/nginx/access.log
