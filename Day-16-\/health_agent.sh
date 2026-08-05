---

### 💡 Script Code (`health_agent.sh`)

Here is the exact code to put inside **`health_agent.sh`**:

```bash
#!/bin/bash
set -euo pipefail

# Configuration Parameters
DISK_THRESHOLD=80
TARGET_HOST="8.8.8.8"

echo "=========================================="
echo "🖥️ SYSTEM HEALTH CHECK AGENT"
echo "Host      : $HOSTNAME"
echo "User      : $USER"
echo "Timestamp : $(date '+%Y-%m-%d %H:%M:%S')"
echo "=========================================="

# 1. Disk Utilization Check
echo -e "\n📊 [1/3] Disk Utilization Audit:"
# Git Bash / Windows / Linux compatibility handling for df output
disk_use=$(df / | tail -1 | awk '{for(i=1;i<=NF;i++) if($i ~ /%/) print $i}' | tr -d '%')

if [ -n "$disk_use" ] && [ "$disk_use" -gt "$DISK_THRESHOLD" ]; then
    echo "  🚨 ALERT: Root disk usage is CRITICAL at ${disk_use}% (Threshold: ${DISK_THRESHOLD}%)"
else
    echo "  🟢 OK: Root disk usage is HEALTHY at ${disk_use:-N/A}%"
fi

# 2. Network Connectivity Validation
echo -e "\n🌐 [2/3] External Network Connectivity:"
# Ping flags compatible with both Git Bash (-n) and Linux (-c)
if ping -n 1 "$TARGET_HOST" > /dev/null 2>&1 || ping -c 1 "$TARGET_HOST" > /dev/null 2>&1; then
    echo "  🟢 OK: Connectivity to $TARGET_HOST is ACTIVE"
else
    echo "  🔴 ALERT: Target host $TARGET_HOST is UNREACHABLE"
fi

# 3. Active Shell / Process Signature
echo -e "\n🔍 [3/3] Runtime Diagnostic Footprint:"
echo "  ▶️ Active Shell Process PID : $$"
echo "  ▶️ Current Working Dir     : $PWD"

echo -e "\n=========================================="
echo "✅ DIAGNOSTIC RUN COMPLETE: Status Clean"
echo "=========================================="
