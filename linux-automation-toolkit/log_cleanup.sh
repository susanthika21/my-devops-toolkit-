#!/usr/bin/env bash
# Description: Cleans and rotates old logs safely

set -euo pipefail

LOG_DIR="${1:-/var/log}"
MAX_DAYS=30

echo "=========================================="
echo "Starting Log Cleanup in $LOG_DIR..."
echo "=========================================="

# Remove compressed or old log archives older than MAX_DAYS
echo "[+] Removing log archives older than $MAX_DAYS days..."
find "$LOG_DIR" -type f \( -name "*.gz" -o -name "*.old" \) -mtime +$MAX_DAYS -exec rm -f {} \;

# Truncate active log files larger than 50MB to prevent breaking running apps
echo "[+] Truncating oversized active log files..."
find "$LOG_DIR" -type f -name "*.log" -size +50M -exec truncate -s 0 {} \;

echo "[✔] Log cleanup finished successfully."
