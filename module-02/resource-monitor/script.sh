#!/usr/bin/env bash

INTERVAL=10

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/monitor.log"

check_dependencies() {
    for command in date free df uptime sleep; do
        if ! command -v "$command" > /dev/null 2>&1; then
            echo "Error: required command '$command' is not available." >&2
            exit 1
        fi
    done
}

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

check_dependencies

while true; do
    collect_metrics
    sleep "$INTERVAL"
done
