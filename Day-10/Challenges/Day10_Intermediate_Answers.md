🟡 Intermediate Answers (10.11 -- 10.25) Answer 10.11 Bash #!/bin/bash
set -euo pipefail

touch access.log rotated="access.log.\$(date +%Y%m%d\_%H%M%S)"

mv access.log "\${rotated}" touch access.log

echo "Rotated log to ${rotated} and recreated access.log"
rm -f access.log "${rotated}" Answer 10.12 Bash #!/bin/bash set -euo
pipefail

hosts=("127.0.0.1" "8.8.8.8" "192.0.2.1") online=() offline=()

for h in "${hosts[@]}"; do
  if ping -c 1 -W 2 "${h}" \>/dev/null 2\>&1; then online+=("${h}")
  else
    offline+=("${h}") fi done

echo "Online Hosts : \${online\[\*\]}" echo "Offline Hosts :
\${offline\[\*\]}" Answer 10.13 Bash #!/bin/bash set -euo pipefail

echo "=== PROCESS TELEMETRY ===" ps -p \$\$ -o pid,ppid,comm,args Answer
10.14 Bash #!/bin/bash set -euo pipefail

load1=\$(awk '{print $1}' /proc/loadavg)
load_int=$(awk -v l="\${load1}" 'BEGIN {print int(l \* 100)}')

if (( load_int \> 200 )); then echo "TELEMETRY_ALERT: 1-min load average
is HIGH (${load1})"
else
  echo "TELEMETRY_OK: Load average is normal (${load1})" fi Answer 10.15
Bash #!/bin/bash set -euo pipefail

host="" port="" env=""

while getopts "h:p:e:" opt; do case "${opt}" in
    h) host="${OPTARG}" ;; p) port="${OPTARG}" ;;
    e) env="${OPTARG}" ;; \*) exit 1 ;; esac done

echo "Config Loaded -\> Host: \${host:-N/A} \| Port: \${port:-N/A} \|
Env: \${env:-N/A}" Answer 10.16 Bash #!/bin/bash set -euo pipefail

verify_port() { local p="$1"
  case "${p}" in 5432) echo "PORT_MATCH: PostgreSQL (${p})" ;;
    3306) echo "PORT_MATCH: MySQL (${p})" ;; 6379) echo "PORT_MATCH:
Redis (${p})" ;;
    *)    echo "PORT_UNKNOWN: Non-standard database port (${p})" ;; esac
}

verify_port 5432 verify_port 8080 Answer 10.17 Bash #!/bin/bash set -euo
pipefail

SAFE_MODE="OFF" force_flag="\${1:-}"

if \[\[ "\${SAFE_MODE}" == "ON" \]\]; then echo "ABORT: SAFE_MODE is
ON!" \>&2 exit 1 fi

if \[\[ "\${force_flag}" != "--force" \]\]; then echo "ABORT: Explicit
--force flag required!" \>&2 exit 1 fi

echo "Purging workspace safely..." Answer 10.18 Bash #!/bin/bash set
-euo pipefail

read -r total avail \<\<\< "\$(free -m \| awk '/Mem:/ {print \$2, $7}')"
used_pct=$(( ((total - avail) \* 100) / total ))

if (( used_pct \> 80 )); then echo "MEMORY_ALERT: Usage at
${used_pct}% (${total}MB total)" else echo "MEMORY_OK: Usage at
\${used_pct}%" fi Answer 10.19 Bash #!/bin/bash set -euo pipefail

pid_file="/tmp/app.pid"

if \[\[ -f "${pid_file}" ]]; then
  existing_pid=$(cat"${pid_file}")
  if kill -0 "${existing_pid}" 2\>/dev/null; then echo "ERROR: Process
\${existing_pid} is already running!" \>&2 exit 1 else echo "Stale
lockfile detected. Overwriting..." fi fi

echo "$$" > "${pid_file}"
trap 'rm -f "${pid_file}"' EXIT
echo "Acquired execution lock under PID $$" Answer 10.20 Bash
#!/bin/bash set -euo pipefail

usage() { echo "Usage: \$0 \[-e environment\] \[-v\]" exit 1 }

while getopts "e:v" opt; do case "\${opt}" in e) echo "Env: \${OPTARG}"
;; v) echo "Verbose mode enabled" ;; ?) usage ;; esac done Answer 10.21
Bash #!/bin/bash set -euo pipefail

# Create dummy logs

touch app_20260807_01.log app_20260807_02.log app_20260807_03.log
app_20260807_04.log

readarray -t logs \< \<(ls -t app\_\*.log 2\>/dev/null \|\| true)

if (( ${#logs[@]} > 3 )); then
  for (( i=3; i<${#logs\[@\]}; i++ )); do echo "Removing old log:
${logs[i]}"
    rm -f "${logs\[i\]}" done fi

rm -f app\_\*.log Answer 10.22 Bash #!/bin/bash set -euo pipefail

port=8080

if nc -z -w 1 127.0.0.1 "${port}" 2>/dev/null; then
  echo "PORT_ACTIVE: Service is listening on 127.0.0.1:${port}" else
echo "PORT_INACTIVE: No service detected on 127.0.0.1:\${port}" fi
Answer 10.23 Bash #!/bin/bash set -euo pipefail

pid="\$$"
etimes=$(ps -p"\${pid}" -o etimes= \| tr -d ' ')

if (( etimes \> 3600 )); then echo "UPTIME_ALERT: PID \${pid} running
for \${etimes}s (\> 3600s)" else echo "UPTIME_OK: PID \${pid} running
for \${etimes}s" fi Answer 10.24 Bash #!/bin/bash set -euo pipefail

verbose=false file_path=""

while getopts "vf:" opt; do case "${opt}" in
    v) verbose=true ;;
    f) file_path="${OPTARG}" ;; \*) exit 1 ;; esac done

echo "Options -\> Verbose: \${verbose} \| File: \${file_path:-None}"
Answer 10.25 Bash #!/bin/bash set -euo pipefail

rss_kb=\$(ps -p \$\$ -o rss= \| tr -d ' ') rss_mb=\$(( rss_kb / 1024 ))

echo "=== PROCESS MEMORY TELEMETRY ===" echo "PID : \$\$" echo "RSS
Memory : ${rss_mb} MB (${rss_kb} KB)"
