🟡 Intermediate Answers (6.11 -- 6.25)Answer 6.11Bash#!/bin/bash
host="\${1:-127.0.0.1}"

ping -c 1 "$host" >/dev/null 2>&1
status=$?

if (( status != 0 )); then echo "Ping failed. Retrying..." sleep 1 ping
-c 1 "\$host" \>/dev/null 2\>&1 if (( \$? != 0 )); then echo
"\[CRITICAL\] Host \$host is unreachable!" \>&2 exit 1 fi fi

echo "\[OK\] Host $host is reachable."
Answer 6.12Bash#!/bin/bash
val=$(( RANDOM % 100 ))

if (( val \< 70 )); then echo "Routed to Primary Pool (Val: \$val)" else
echo "Routed to Fallback Pool (Val: $val)"
fi
Answer 6.13Bash#!/bin/bash
read -r total used <<< "$(free -m \| awk 'NR==2 {print \$2, $3}')"
mem_pct=$(( (used \* 100) / total ))

echo "Memory Usage: ${mem_pct}%"
if (( mem_pct > 85 )); then
  echo "[CRITICAL] Memory threshold breached (${mem_pct}% \> 85%)!" \>&2
else echo "\[OK\] Memory levels normal." fi Answer 6.14Bash#!/bin/bash
if (( \$# == 0 )); then echo "Usage: \$0 \<dev\|staging\|prod\>" \>&2
exit 1 fi

env="$1"
case "$env" in dev\|staging\|prod) echo "Environment '$env' validated."
    ;;
  *)
    echo "Error: Invalid environment '$env'! Must be dev, staging, or
prod." \>&2 exit 1 ;; esac Answer 6.15Bash#!/bin/bash \# Create dummy
config cat \<\< 'EOF' \> app.conf PORT=8080 ENV=production EOF

while read -r line \|\| \[ -n "$line" ]; do
  [ -z "$line" \] && continue key="${line%%=*}"
  val="${line#\*=}" echo "Exporting \$key -\> $val"
  export "$key=\$val" done \< app.conf

rm -f app.conf Answer 6.16Bash#!/bin/bash declare -r CONFIG_PORT=8080
declare -r CONFIG_HOST="127.0.0.1"

echo "Bound to $CONFIG_HOST:$CONFIG_PORT" \# CONFIG_PORT=9090 \#
Triggers error: CONFIG_PORT: readonly variable Answer
6.17Bash#!/bin/bash IFS=":" read -r -a dirs \<\<\< "\$PATH"

valid_count=0 invalid_count=0

for dir in "${dirs[@]}"; do
  if [ -d "$dir" \]; then ((valid_count++)) else ((invalid_count++)) fi
done

echo "PATH Audit: \$valid_count valid directories,
$invalid_count invalid."
Answer 6.18Bash#!/bin/bash
cpu_load=$(awk '{print int($1)}' /proc/loadavg)
mem_used=$(free \| awk'/Mem:/ {print int((\$3/$2)*100)}')
disk_used=$(df / \| awk 'NR==2 {print int(\$5)}')

echo "=== SYSTEM HEALTH CARD ===" echo "CPU Load : \$cpu_load" echo
"Memory : \${mem_used}%" echo "Disk : \${disk_used}%"

if (( cpu_load \> 4 \|\| mem_used \> 85 \|\| disk_used \> 80 )); then
echo "Status: \[WARNING\] System thresholds breached!" else echo
"Status: \[OK\] System healthy." fi Answer 6.19Bash#!/bin/bash
tool="\${1:-curl}"

if ! command -v "$tool" >/dev/null 2>&1; then
  echo "Error: Required tool '$tool' is not installed." \>&2 exit 127 fi

echo "Tool '\$tool' verified at: $(command -v "$tool")" Answer
6.20Bash#!/bin/bash attempts=3 success=0

for (( i=1; i\<=attempts; i++ )); do echo "Health probe attempt $i..."
  # Simulate failing probe
  if [ "$i" -eq 99 \]; then success=1 break fi sleep 1 done

if (( success == 0 )); then echo "\[ALERT\] All health checks failed!
Triggering rollback..." \>&2 exit 1 fi Answer 6.21Bash#!/bin/bash
conn_str="db.internal.net:5432"

host="${conn_str%:*}"
port="${conn_str#\*:}"

echo "Host: \$host \| Port: $port"
Answer 6.22Bash#!/bin/bash
find_free_port() {
  local port
  while true; do
    port=$(( 8000 + (RANDOM % 1000) )) \# Check if port is in use if !
nc -z 127.0.0.1"$port" 2>/dev/null; then
      echo "$port" return 0 fi done }

assigned_port=\$(find_free_port) echo "Found free port: \$assigned_port"
Answer 6.23Bash#!/bin/bash env="" version=""

while getopts "e:v:" opt; do case "$opt" in
    e) env="$OPTARG" ;; v) version="\$OPTARG" ;; \*) exit 1 ;; esac done

if \[ -z "$env" ] || [ -z "$version" \]; then echo "Error: Flags -e
`<env>`{=html} and -v `<version>`{=html} are required!" \>&2 exit 1 fi

echo "Deploying version \$version to $env"
Answer 6.24Bash#!/bin/bash
readonly EXPECTED_PORT=8080
current_port="${1:-8080}"

if (( current_port != EXPECTED_PORT )); then echo "\[DRIFT DETECTED\]
Configured port ($current_port) does not match lock ($EXPECTED_PORT)!"
\>&2 else echo "\[OK\] No configuration drift detected." fi Answer
6.25Bash#!/bin/bash echo "=== DEPLOYMENT DASHBOARD ===" echo "Target:
Production Cluster" echo "Health: OK" echo ""

read -r -p "Proceed with deployment? (y/N):" confirm if \[\[
"$confirm" =~ ^[yY]$ \]\]; then echo "Deployment initiated..." else echo
"Deployment cancelled by user." exit 0 fi
