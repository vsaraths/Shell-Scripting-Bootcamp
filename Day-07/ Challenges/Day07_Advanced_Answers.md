🔴 Advanced Answers (7.26 -- 7.35)Answer 7.26Bash#!/bin/bash
load1=\$(awk '{print $1}' /proc/loadavg)
load_int=$(awk -v l="\$load1" 'BEGIN {print int(l \* 100)}')

read -r mem_total mem_avail \<\<\< "\$(free -m \| awk '/Mem:/ {print
\$2, $7}')"
mem_pct=$(( ((mem_total - mem_avail) \* 100) / mem_total ))

disk_pct=\$(df / \| awk 'NR==2 {print \$5}' \| tr -d '%')

warnings=0 criticals=0

(( load_int \> 300 )) && (( criticals++ )) \|\| { (( load_int \> 150 ))
&& (( warnings++ )) \|\| true; } (( mem_pct \> 90 )) && (( criticals++
)) \|\| { (( mem_pct \> 75 )) && (( warnings++ )) \|\| true; } ((
disk_pct \> 90 )) && (( criticals++ )) \|\| { (( disk_pct \> 80 )) && ((
warnings++ )) \|\| true; }

if (( criticals \> 0 \|\| warnings \>= 2 )); then echo "CLUSTER STATUS:
DEGRADED (Criticals: \$criticals, Warnings: \$warnings)" else echo
"CLUSTER STATUS: HEALTHY (Criticals: \$criticals, Warnings: $warnings)"
fi
Answer 7.27Bash#!/bin/bash
gateway_ip=$(ip route show default 2\>/dev/null \| awk '/default/ {print
\$3}')

if \[ -z "\$gateway_ip" \]; then echo "No default gateway found." exit 1
fi

ip_regex='\^(\[0-9\]{1,3}.){3}\[0-9\]{1,3}$'
if [[ "$gateway_ip" =\~ \$ip_regex \]\]; then echo "Gateway IP
$gateway_ip syntax validated."
  if ping -c 1 -W 2 "$gateway_ip" \>/dev/null 2\>&1; then echo "Gateway
\$gateway_ip is REACHABLE." else echo "Gateway
$gateway_ip is UNREACHABLE!" >&2
  fi
fi
Answer 7.28Bash#!/bin/bash
start_ms=$(date +%s%3N)

# Target task simulation

sleep 0.2

end_ms=$(date +%s%3N)
delta=$(( end_ms - start_ms ))

echo "Execution Profile: Task completed in ${delta}ms."
Answer 7.29Bash#!/bin/bash
file="${1:-/var/log/app.log}"

if \[ ! -f "\$file" \]; then echo "File \$file does not exist." exit 1
fi

size_mb=\$(( $(wc -c < "$file") / 1048576 ))
line_count=$(wc -l < "$file")

if (( size_mb \> 100 \|\| line_count \> 1000000 )); then echo "DECISION:
ROTATE_AND_ARCHIVE (Size: \${size_mb}MB, Lines: \$line_count)" elif ((
size_mb \> 50 )); then echo "DECISION: COMPRESS (Size: \${size_mb}MB)"
else echo "DECISION: NO_ACTION (Size: \${size_mb}MB)" fi Answer
7.30Bash#!/bin/bash endpoints=("https://httpbin.org/get"
"https://httpbin.org/delay/0")

for ep in "${endpoints[@]}"; do
  time_sec=$(curl -s -o /dev/null -w"%{time_total}" --connect-timeout 3
"$ep" || echo "9.999")
  ms=$(awk -v t="\$time_sec" 'BEGIN {print int(t \* 1000)}')

if (( ms \< 300 )); then status="OPTIMAL" elif (( ms \<= 1000 )); then
status="DEGRADED" else status="CRITICAL" fi

echo "Endpoint: \$ep \| Latency: \${ms}ms \| Status: \$status" done
Answer 7.31Bash#!/bin/bash echo "=== TOP 3 MEMORY CONSUMING PROCESSES
===" ps -eo pid,comm,rss --sort=-rss \| head -n 4 \| awk 'NR\>1 {printf
"PID: %-8s \| Cmd: %-15s \| RSS: %d MB`\n`{=tex}", \$1, \$2, $3/1024}'
Answer 7.32Bash#!/bin/bash
domain="${1:-example.com}"

exp_date=$(timeout 5 openssl s_client -servername "$domain" -connect
"\$domain:443" `</dev/null 2>`{=html}/dev/null \| openssl x509 -noout
-enddate 2\>/dev/null \| cut -d= -f2 \|\| true)

if \[ -n "$exp_date" ]; then
  exp_epoch=$(date -d"$exp_date" +%s)
  now_epoch=$(date +%s) days_left=\$(( (exp_epoch - now_epoch) / 86400
))

if (( days_left \< 7 )); then echo "CRITICAL: SSL for \$domain expires
in \$days_left days!" elif (( days_left \< 30 )); then echo "WARN: SSL
for \$domain expires in \$days_left days." else echo "OK: SSL for
\$domain valid for \$days_left days." fi else echo "Unable to fetch SSL
cert for $domain"
fi
Answer 7.33Bash#!/bin/bash
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git branch --show-current)
commit=$(git rev-parse --short HEAD)
  dirty=$(git status --porcelain)

echo "Git Branch : \$branch" echo "Git Commit : \$commit"

if \[ -z "$dirty" ]; then
    echo "Pipeline Status: ELIGIBLE FOR DEPLOYMENT (Clean Tree)"
  else
    echo "Pipeline Status: BLOCKED (Uncommitted Changes Detected)"
  fi
else
  echo "Not a Git repository."
fi
Answer 7.34Bash#!/bin/bash
src_dir="${1:-/tmp}" ts=$(date +%Y%m%d_%H%M%S)
archive="/tmp/backup_$ts.tar.gz"

tar -czf "$archive" "$src_dir" 2\>/dev/null size=$(wc -c < "$archive")
checksum=$(sha256sum "$archive" \| awk '{print \$1}')

if (( size \> 0 )); then echo "Backup Validated: \$archive" echo " Size
: \$size bytes" echo " SHA256 : \$checksum" else echo "Backup Failed:
Archive size is 0 bytes" \>&2 exit 1 fi

rm -f "\$archive" Answer 7.35Bash#!/bin/bash set -euo pipefail

# Command captures

host_name=$(hostname)
curr_user=$(whoami) os_release=$(uname -sr)
time_stamp=$(date +"%Y-%m-%d %H:%M:%S")

# Metric captures

read -r mem_total mem_avail \<\<\< "\$(free -m \| awk '/Mem:/ {print
\$2, $7}')"
mem_used_pct=$(( ((mem_total - mem_avail) \* 100) / mem_total ))

disk_used_pct=\$(df / \| awk 'NR==2 {print $5}' | tr -d '%')
load_1min=$(awk'{print \$1}' /proc/loadavg)

# Evaluation

status="HEALTHY" if (( mem_used_pct \> 85 \|\| disk_used_pct \> 85 ));
then status="CRITICAL" elif (( mem_used_pct \> 70 \|\| disk_used_pct \>
70 )); then status="WARNING" fi

echo "===============================================" echo " ENTERPRISE
TELEMETRY REPORT " echo
"===============================================" echo " Timestamp :
\$time_stamp" echo " Host/User : \$host_name / \$curr_user" echo "
OS/Kernel : \$os_release" echo
"-----------------------------------------------" echo " 1-Min Load:
\$load_1min" echo " RAM Usage : $mem_used_pct% ($((mem_total -
mem_avail))MB / \${mem_total}MB)" echo " Root Disk : \$disk_used_pct%"
echo "-----------------------------------------------" echo " Overall
Status: \$status" echo "==============================================="
