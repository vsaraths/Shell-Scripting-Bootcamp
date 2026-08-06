🔴 Advanced Answers (6.26 -- 6.35)Answer 6.26Bash#!/bin/bash
check_status() { local desc="\$1" local expected_code="\$2" local
actual_code="\$3"

if (( actual_code != expected_code )); then echo "\[FAIL\] \$desc -
Expected exit code \$expected_code, got \$actual_code" \>&2 return 1 fi
echo "\[PASS\] \$desc - Exit code \$actual_code matches expected" return
0 }

# Test execution

ls /valid_path \>/dev/null 2\>&1 check_status "List valid directory" 0
\$?

ls /non_existent_folder \>/dev/null 2\>&1 check_status "List missing
directory" 2 $? || true
Answer 6.27Bash#!/bin/bash
canary_route() {
  local val=$(( RANDOM % 100 ))

if (( val \< 50 )); then echo "node1 (50% Canary Share)" elif (( val \<
80 )); then echo "node2 (30% Canary Share)" else echo "node3 (20% Canary
Share)" fi }

echo "Simulating 5 requests:" for i in {1..5}; do echo "Request \$i -\>
$(canary_route)"
done
Answer 6.28Bash#!/bin/bash
df -P | tail -n +2 | while read -r filesystem blocks used avail capacity mounted; do
  usage="${capacity%*%}" if (( usage \> 80 )); then echo "\[WARNING\]
High block usage on $filesystem ($mounted): \${usage}%" \>&2 fi done
Answer 6.29Bash#!/bin/bash \# Sample parser for .env files
parse_env_line() { local line="$1"
  # Strip comments and trim
  line="${line%%#*}" line="$(echo "$line" \| xargs)"

\[ -z "\$line" \] && return 0

local key="${line%%=*}"
  local val="${line#\*=}"

\# Strip surrounding quotes val="${val#\"}"
  val="${val%\"}" val="${val#\'}"
  val="${val%\'}"

echo "KEY: \$key \| VALUE: \$val" }

parse_env_line ' DATABASE_URL="postgres://localhost/db" \# DB Config '
Answer 6.30Bash#!/bin/bash set -euo pipefail

readonly LOG_FILE="/tmp/deploy_script.log"

cleanup() { echo "Execution finished with status \$?" } trap cleanup
EXIT

if (( \$# \< 1 )); then echo "Error: Target missing!" \>&2 exit 1 fi

echo "Running fail-safe task for \$1..." Answer 6.31Bash#!/bin/bash
max_attempts=5 attempt=1

while \[ \$attempt -le \$max_attempts \]; do echo "Attempt \$attempt of
\$max_attempts..."

\# Simulate command execution if \[ \$attempt -eq 4 \]; then echo
"Operation Succeeded!" exit 0 fi

sleep_time=\$(( (2 \*\* attempt) + (RANDOM % 3) )) echo "Failed.
Retrying in \${sleep_time}s..." sleep \$sleep_time ((attempt++)) done

echo "Operation failed after \$max_attempts attempts." \>&2 exit 1
Answer 6.32Bash#!/bin/bash required_files=("/etc/passwd" "/etc/hosts"
"/non_existent_config.conf") missing=0

for file in "${required_files[@]}"; do
  if [ ! -f "$file" \] \|\| \[ ! -r "$file" ] || [ ! -s "$file" \]; then
echo "Dependency check failed for: \$file" \>&2 ((missing++)) fi done

if (( missing \> 0 )); then echo "Error: \$missing required file
dependencies failed check." \>&2 exit 3 fi Answer 6.33Bash#!/bin/bash
conn="user:secret123@db.internal.net:5432/production_db"

userpass="${conn%%@*}"
user="${userpass%%:*}" pass="\${userpass#*:}"

hostport_db="${conn#*@}"
db="${hostport_db#*/}" hostport="\${hostport_db%%/*}"

host="${hostport%%:*}"
port="${hostport#\*:}"

echo "User : \$user" echo "Pass : \$pass" echo "Host : \$host" echo
"Port : \$port" echo "DB : \$db" Answer 6.34Bash#!/bin/bash readonly
INFRA_HOST="prod-db.internal" readonly INFRA_PORT="5432"

lock_guard() { echo "Infrastructure immutable configuration active:"
echo "Host: \$INFRA_HOST \| Port: \$INFRA_PORT"

\# Intercept mutations if \[ "\${1:-}" = "override" \]; then echo
"\[SECURITY VIOLATION\] Attempted to override immutable configuration!"
\>&2 return 1 fi }

lock_guard Answer 6.35Bash#!/bin/bash set -euo pipefail

# Argument Guard

if (( \$# \< 1 )); then echo "Usage: \$0 `<environment>`{=html}" \>&2
exit 1 fi

readonly ENV="$1"
readonly DATE=$(date +%Y-%m-%d)

# Threshold Checks

mem_used=\$(free \| awk '/Mem:/ {print int((\$3/$2)*100)}')
disk_used=$(df / \| awk 'NR==2 {print int(\$5)}')

if (( mem_used \> 90 \|\| disk_used \> 90 )); then echo "\[CRITICAL\]
Pre-flight system checks failed! Memory: \${mem_used}%, Disk:
\${disk_used}%" \>&2 exit 2 fi

# Target Canary Node Selection

nodes=("node-alpha" "node-beta" "node-gamma")
canary_index=$(( RANDOM % 3 ))
target_node="${nodes\[\$canary_index\]}"

echo "==========================================" echo " ENTERPRISE
DEPLOYMENT DASHBOARD " echo "=========================================="
echo " Date : \$DATE" echo " Environment : \$ENV" echo " Target Node :
\$target_node" echo " System Mem : \${mem_used}% \[OK\]" echo " System
Disk : \${disk_used}% \[OK\]" echo
"==========================================" echo " Status : READY FOR
DEPLOYMENT" echo "=========================================="
