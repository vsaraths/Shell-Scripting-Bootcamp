🟡 Intermediate Answers (7.11 -- 7.25)Answer 7.11Bash#!/bin/bash
arch=$(uname -m)
os=$(uname -s)

echo "=========================" echo " System Architecture Card" echo "
OS Name : \$os" echo " Arch : $arch"
echo "========================="
Answer 7.12Bash#!/bin/bash
uptime_sec=$(awk '{print int($1)}' /proc/uptime)
uptime_min=$(( uptime_sec / 60 ))

if (( uptime_min \< 60 )); then echo "STATUS: RECENT_REBOOT (Uptime:
\${uptime_min}m)" else echo "STATUS: STABLE (Uptime: ${uptime_min}m)"
fi
Answer 7.13Bash#!/bin/bash
user_count=$(wc -l \< /etc/passwd)

if (( user_count \> 50 )); then echo "Enterprise Environment
($user_count accounts)"
else
  echo "Standard Environment ($user_count accounts)" fi Answer
7.14Bash#!/bin/bash port="\${1:-8080}"

if (( port \>= 1024 && port \<= 65535 )); then echo "VALID: Port \$port
is a valid non-privileged user port." else echo "INVALID: Port
$port is reserved or out of bounds!" >&2
  exit 1
fi
Answer 7.15Bash#!/bin/bash
status_code="${1:-200}"

if (( status_code \>= 200 && status_code \< 300 )); then echo "HTTP
Status \$status_code: OK" elif (( status_code \>= 300 && status_code \<
400 )); then echo "HTTP Status \$status_code: REDIRECT" elif ((
status_code \>= 400 && status_code \< 500 )); then echo "HTTP Status
\$status_code: CLIENT_ERR" elif (( status_code \>= 500 && status_code \<
600 )); then echo "HTTP Status \$status_code: SERVER_ERR" else echo
"HTTP Status $status_code: UNKNOWN"
fi
Answer 7.16Bash#!/bin/bash
file="${1:-/var/log/syslog}"

if \[ -f "$file" ]; then
  size=$(wc -c \<"\$file") \# 10MB = 10485760 bytes, 50MB = 52428800
bytes if (( size \>= 10485760 && size \<= 52428800 )); then echo
"WARNING: File $file size ($size bytes) is in the warning band
\[10MB-50MB\]!" else echo "File $file size ($size bytes) is outside
warning range." fi else echo "File $file not found."
fi
Answer 7.17Bash#!/bin/bash
ts=$(date +%Y%m%d\_%H%M%S) target_dir="/tmp/audit\_\$ts"

mkdir -p "\$target_dir" echo "Created timestamped directory:
$target_dir"
Answer 7.18Bash#!/bin/bash
load1=$(awk '{print $1}' /proc/loadavg)
# Multiply by 100 to convert float to int for integer comparison
load_int=$(awk -v l="\$load1" 'BEGIN {print int(l \* 100)}')

if (( load_int \< 100 )); then echo "Load Level: LOW ($load1)"
elif (( load_int <= 300 )); then
  echo "Load Level: MODERATE ($load1)" else echo "Load Level: CRITICAL
($load1)"
fi
Answer 7.19Bash#!/bin/bash
ip=$(hostname -I 2\>/dev/null \| awk '{print \$1}' \|\| echo"127.0.0.1")

if \[\[ "\$ip" =\~ \^10. \]\]; then echo "IP
$ip: Class A Private Subnet"
elif [[ "$ip" =\~ \^172.(1\[6-9\]\|2\[0-9\]\|3\[0-1\]). \]\]; then echo
"IP $ip: Class B Private Subnet"
elif [[ "$ip" =\~ \^192.168. \]\]; then echo "IP \$ip: Class C Private
Subnet" else echo "IP $ip: Loopback or External Subnet"
fi
Answer 7.20Bash#!/bin/bash
logged_users=$(who \| wc -l)

if (( logged_users == 0 )); then echo "Session Audit: NO_USERS logged
in" elif (( logged_users \<= 5 )); then echo "Session Audit: NORMAL
($logged_users active sessions)"
else
  echo "Session Audit: HIGH_CONCURRENCY ($logged_users active sessions)"
fi Answer 7.21Bash#!/bin/bash file="\${1:-/etc/passwd}"

if \[ -f "$file" ]; then
  lines=$(wc -l \<"\$file") if (( lines \>= 50 && lines \<= 200 )); then
echo "VALIDATION PASSED: \$file has \$lines lines (50 \<= lines \<=
200)." else echo "VALIDATION FAILED: \$file has \$lines lines." fi else
echo "File $file does not exist."
fi
Answer 7.22Bash#!/bin/bash
avail_gb=$(df -BG / \| awk 'NR==2 {print \$4}' \| tr -d 'G')

if (( avail_gb \> 5 )); then echo "Disk Check Passed: \${avail_gb}GB
available on root partition." else echo "Disk Check Warning: Only
${avail_gb}GB available on root partition!" >&2
fi
Answer 7.23Bash#!/bin/bash
file="${1:-\$0}"

if \[ -f "$file" ]; then
  mod_time=$(date -r"$file" +%s)
  now=$(date +%s) age_days=\$(( (now - mod_time) / 86400 ))

if (( age_days \< 7 )); then echo "File $file Age: FRESH ($age_days days
old)" elif (( age_days \<= 30 )); then echo "File
$file Age: STALE ($age_days days old)" else echo "File
$file Age: ARCHIVE_READY ($age_days days old)" fi fi Answer
7.24Bash#!/bin/bash read -r total avail \<\<\< "\$(free -m \| awk
'/Mem:/ {print \$2, $7}')"
used=$(( total - avail )) pct=\$(( (used \* 100) / total ))

if (( pct \>= 60 && pct \<= 85 )); then echo "RAM Usage Nominal:
\${pct}% (Bounded between 60% and 85%)" else echo "RAM Usage Alert:
${pct}%"
fi
Answer 7.25Bash#!/bin/bash
os_type=$(uname -s) kernel_ver=$(uname -r)
host_name=$(hostname) usr_name=\$(whoami)

echo "+------------------------------------------+" echo "\| ENVIRONMENT
INSPECTOR CARD \|" echo "+------------------------------------------+"
printf "\| %-12s : %-23s \|`\n`{=tex}" "Host" "$host_name"
printf "| %-12s : %-23s |\n" "User" "$usr_name" printf "\| %-12s : %-23s
\|`\n`{=tex}" "OS" "$os_type"
printf "| %-12s : %-23s |\n" "Kernel" "$kernel_ver" echo
"+------------------------------------------+"
