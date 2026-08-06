🔴 Advanced Answers (10.26 -- 10.35) Answer 10.26 Bash #!/bin/bash set
-euo pipefail

log_file="app.log" max_lines=100

# Simulate log creation

for i in {1..105}; do echo "Log entry $i" >> "${log_file}"; done

if (( $(wc -l < "${log_file}") \>= max_lines )); then
rotated="app\_$(date +%Y%m%d_%H%M%S).log"
  mv "${log_file}" "${rotated}"
  gzip "${rotated}" :\> "\${log_file}" echo "Rotated and compressed -\>
\${rotated}.gz" fi

# Cleanup

rm -f app\* Answer 10.27 Bash #!/bin/bash set -euo pipefail

hosts=("127.0.0.1" "8.8.8.8" "1.1.1.1" "10.255.255.1" "192.0.2.1")
declare -A pids

echo "Launching parallel ICMP health checks..." for h in
"${hosts[@]}"; do
  ping -c 1 -W 2 "${h}" \>/dev/null 2\>&1 & pids\["${h}"]=$! done

echo "=== CLUSTER REACHABILITY MATRIX ===" for h in "${!pids[@]}"; do
  if wait "${pids\[\$h\]}"; then echo " \[+\] \${h} : ONLINE" else echo
" \[-\] \${h} : OFFLINE" fi done Answer 10.28 Bash #!/bin/bash set -euo
pipefail

lock_file="/tmp/app.lock"

acquire_lock() { if \[\[ -f "${lock_file}" ]]; then
    local lock_pid
    lock_pid=$(cat"${lock_file}")
    if kill -0 "${lock_pid}" 2\>/dev/null; then echo "CRITICAL: Active
process \${lock_pid} holds the lock." \>&2 return 1 else echo "WARN:
Stale lock detected (PID ${lock_pid} dead). Recovering..."
    fi
  fi
  echo "$$" > "${lock_file}" echo "Lock acquired under PID \$\$" }

acquire_lock rm -f "\${lock_file}" Answer 10.29 Bash #!/bin/bash set
-euo pipefail

load_sum=0 samples=3

echo "Collecting system telemetry over ${samples} samples..."
for (( i=1; i<=samples; i++ )); do
  load1=$(awk '{print $1}' /proc/loadavg)
  load_int=$(awk -v l="\${load1}" 'BEGIN {print int(l \* 100)}') ((
load_sum += load_int )) sleep 1 done

avg_load=$(awk -v s="${load_sum}" -n "\${samples}" 'BEGIN {printf
"%.2f", (s / n) / 100}') echo "Average 1-Min Load over \${samples}s:
\${avg_load}" Answer 10.30 Bash #!/bin/bash set -euo pipefail

env="" port=5432 verbose=false

while getopts "e:p:v" opt; do case "${opt}" in
    e) env="${OPTARG}" ;; p) port="\${OPTARG}" ;; v) verbose=true ;; \*)
echo "Usage: \$0 -e `<env>`{=html} \[-p port\] \[-v\]" \>&2; exit 1 ;;
esac done

shift \$(( OPTIND - 1 ))

if \[\[ -z "\${env}" \]\]; then echo "ERROR: Option -e
`<environment>`{=html} is required!" \>&2 exit 1 fi

echo "Active Config -\> Env: \${env} \| Port: \${port} \| Verbose:
\${verbose}" echo "Remaining Positional Args: \$\*" Answer 10.31 Bash
#!/bin/bash set -euo pipefail

approved_ports=(22 80 443 5432 6379) active_ports=(\$(ss -tuln
2\>/dev/null \| awk 'NR\>1 {print \$5}' \| awk -F':' '{print \$NF}' \|
sort -u \|\| echo "80 22 9999"))

echo "Auditing active listening ports against security baseline..." for
p in "${active_ports[@]}"; do
  approved=false
  for ap in "${approved_ports\[@\]}"; do if (( p == ap )); then
approved=true break fi done if \[\[ "\${approved}" == "false" \]\]; then
echo " \[ALERT\] Unapproved listening port detected: \${p}" else echo "
\[OK\] Approved port: \${p}" fi done Answer 10.32 Bash #!/bin/bash set
-euo pipefail

SAFE_MODE="OFF"

purge_workspace() { local target="\${1:-}"

\[\[ -z "${target}" ]] && { echo "Error: Empty path!" >&2; return 1; }
  [[ "${target}" == "/" \|\| "${target}" == "${HOME}" \]\] && { echo
"Error: Protected path!" \>&2; return 1; } \[\[ "\${SAFE_MODE}" == "ON"
\]\] && { echo "Error: SAFE_MODE is ON!" \>&2; return 1; }

echo "Purge validation passed for '\${target}'." }

purge_workspace "/tmp/scratch_dir" Answer 10.33 Bash #!/bin/bash set
-euo pipefail

# Worker subshell

sleep 2 & worker_pid=\$!

peak_rss=0 while kill -0 "${worker_pid}" 2>/dev/null; do
  rss=$(ps
-p"${worker_pid}" -o rss= 2>/dev/null | tr -d ' ' || echo "0")
  if [[ -n "${rss}" \]\] && (( rss \> peak_rss )); then peak_rss=\${rss}
fi sleep 0.2 done

wait "\${worker_pid}" \|\| true echo "Worker PID \${worker_pid}
completed. Peak RSS: \$(( peak_rss / 1024 )) MB" Answer 10.34 Bash
#!/bin/bash set -euo pipefail

restart_count=0 max_restarts=2

run_service() { echo "Service instance starting..." return 1 \# Simulate
failure }

until run_service; do (( restart_count++ )) echo "\[\$(date +'%T')\]
Service crashed! Restarting (Attempt
${restart_count}/${max_restarts})..." if (( restart_count \>=
max_restarts )); then echo "CRITICAL: Max restarts reached. Aborting
supervisor." \>&2 exit 1 fi sleep 1 done Answer 10.35 Bash #!/bin/bash
set -euo pipefail

# CLI Flag Router

env="prod" port=5432 verbose=false

while getopts "e:p:v" opt; do case "${opt}" in
    e) env="${OPTARG}" ;; p) port="\${OPTARG}" ;; v) verbose=true ;; \*)
exit 1 ;; esac done

# Atomic Lock Acquisition

pid_file="/tmp/telemetry\_$$_${RANDOM}.pid"
echo "$$" \> "${pid_file}"
trap 'rm -f "${pid_file}"' EXIT

# Telemetry

read -r mem_total mem_avail \<\<\< "\$(free -m \| awk '/Mem:/ {print
\$2, $7}')"
mem_pct=$(( ((mem_total - mem_avail) \* 100) / mem_total ))
disk_pct=\$(df / \| awk 'NR==2 {print \$5}' \| tr -d '%')

# Output

echo "==========================================" echo " ENTERPRISE
PROCESS & TELEMETRY ENGINE " echo " Active PID : \$\$ (\${pid_file})"
echo " Environment : \${env}" echo " Target Port : \${port}" echo "
Memory Usage : \${mem_pct}%" echo " Disk Usage : \${disk_pct}%" echo
"=========================================="
