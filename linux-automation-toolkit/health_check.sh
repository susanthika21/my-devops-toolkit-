#!/bin/bash

# Configuration
THRESHOLD=80
EMAIL="susanthika547@gmail.com"
HOSTNAME=$(hostname)

# Initialize alert tracking
ALERT_BODY=""
HAS_ALERT=0

echo "=========================================="
echo "      SYSTEM HEALTH CHECK REPORT          "
echo "=========================================="
echo "Hostname: $HOSTNAME"
echo "Timestamp: $(date)"
echo "------------------------------------------"

# 1. Check Disk Usage & Threshold
echo "[+] Disk Space Usage:"
CURRENT_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')
df -h / | awk 'NR==1 || NR==2 {print $0}'
echo ""

if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
    ALERT_BODY+="WARNING: Root partition disk usage has reached ${CURRENT_USAGE}% (Threshold: ${THRESHOLD}%)\n"
    HAS_ALERT=1
fi

# 2. Check Memory Usage
echo "[+] Memory Usage:"
free -m
echo ""

# 3. Check CPU Load Average
echo "[+] CPU Load Average:"
uptime
echo ""

# 4. Check Critical Services
echo "[+] Service Status Check:"
SERVICES=("jenkins" "docker")
for service in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "  - $service: [RUNNING]"
    else
        echo "  - $service: [STOPPED / NOT FOUND]" >&2
        ALERT_BODY+="WARNING: Critical service '$service' is stopped or not found!\n"
        HAS_ALERT=1
    fi
done

echo "=========================================="
echo "Health check completed."
echo "=========================================="

# 5. Send Email Alert if any issue is detected
if [ "$HAS_ALERT" -eq 1 ]; then
    SUBJECT="CRITICAL ALERT: Health Check Failed on $HOSTNAME"
    echo -e "$ALERT_BODY" | mail -s "$SUBJECT" "$EMAIL"
    echo "[!] Alert email successfully sent to $EMAIL"
else
    echo "[^] All systems normal. No email alert sent."
fi
