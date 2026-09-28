#!/usr/bin/env bash

set -e

echo "=== RAID 1 ==="
cat /proc/mdstat

echo
echo "=== LVM ==="
sudo vgs
sudo lvs

echo
echo "=== MOUNTS ==="
df -h /mnt/raid1 /mnt/lvm
