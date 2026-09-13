#!/usr/bin/env bash

INTERVAL=10

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/monitor.log"

collect_metrics() {
    {
        echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---"
        echo

        echo "[Memory]"
        free -h
        echo

        echo "[Disk]"
        df -h
        echo

        echo "[Uptime]"
        uptime
        echo
    } >> "$LOG_FILE"
}

while true; do
    collect_metrics
    sleep "$INTERVAL"
done
