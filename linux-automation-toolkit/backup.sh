#!/usr/bin/env bash
# Description: Automated directory backup with rotation

set -euo pipefail

# Configuration
SOURCE_DIR="${1:-/var/www/html}"
BACKUP_DIR="${2:-/backups}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_${TIMESTAMP}.tar.gz"
RETENTION_DAYS=7

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

echo "[+] Starting backup of $SOURCE_DIR..."
if tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"; then
    echo "[✔] Backup successfully created: $BACKUP_DIR/$BACKUP_NAME"
else
    echo "[✖] Backup failed!" >&2
    exit 1
fi

# Clean up backups older than retention period
echo "[+] Cleaning up backups older than $RETENTION_DAYS days..."
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +$RETENTION_DAYS -exec rm -f {} \;

echo "[✔] Backup process completed."
