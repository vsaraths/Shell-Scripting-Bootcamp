# Intermediate Answers

🟡 Intermediate Answers (11.11 – 11.25)
Answer 11.11
Bash
#!/bin/bash
set -euo pipefail

read -p "Confirm deployment execution? (y/N): " -r confirm

if [[ "${confirm:-n}" =~ ^[yY]$ ]]; then
  tx_id="TX-$(( 100000 + RANDOM % 900000 ))"
  echo "Deployment Confirmed. Transaction ID: ${tx_id}"
else
  echo "Deployment Cancelled by user."
  exit 0
fi
Answer 11.12
Bash
#!/bin/bash
set -euo pipefail

log_audit() {
  local msg="$1"
  local line="$2"
  local ts
  ts=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  echo "[${ts}] [${USER}@${HOSTNAME}] [LINE:${line}] ${msg}"
}

log_audit "Pipeline initialized" "${LINENO}"
Answer 11.13
Bash
#!/bin/bash
set -euo pipefail

servers=("srv-alpha" "srv-beta" "srv-gamma")

for srv in "${servers[@]}"; do
  job_id="JOB-$(( 1000 + RANDOM % 9000 ))"
  echo "Assigned ${srv} -> ${job_id}"
done
Answer 11.14
Bash
#!/bin/bash
set -euo pipefail

env_opt=""
region_opt=""

while getopts "e:r:" opt; do
  case "${opt}" in
    e) env_opt="${OPTARG}" ;;
    r) region_opt="${OPTARG}" ;;
    *) exit 1 ;;
  esac
done

if [[ -z "${env_opt}" ]]; then
  read -p "Environment (-e) missing. Enter value [staging]: " -r env_opt
  env_opt="${env_opt:-staging}"
fi

echo "Pipeline Context -> Env: ${env_opt} | Region: ${region_opt:-us-east-1}"
Answer 11.15
Bash
#!/bin/bash
set -euo pipefail

audit_file="/tmp/pipeline_audit.log"

{
  echo "=== PIPELINE AUDIT REPORT ==="
  echo "User      : ${USER}"
  echo "Host      : ${HOSTNAME}"
  echo "Timestamp : $(date)"
  echo "Status    : SUCCESS"
} | tee "${audit_file}"

rm -f "${audit_file}"
Answer 11.16
Bash
#!/bin/bash
set -euo pipefail

error_handler() {
  local line="$1"
  echo "[CRITICAL ERROR] Pipeline failed at line ${line} by user ${USER} on ${HOSTNAME}!" >&2
}

trap 'error_handler $LINENO' ERR

# Simulation step
echo "Executing task step..."
# false # Uncommenting triggers trap error handler
Answer 11.17
Bash
#!/bin/bash
set -euo pipefail

services=("auth" "db" "cache")
results=()

for svc in "${services[@]}"; do
  # Simulate health check
  if [[ "${svc}" != "db" ]]; then
    results+=("${svc}:PASS")
  else
    results+=("${svc}:FAIL")
  fi
done

echo "Health Results: ${results[*]}"
Answer 11.18
Bash
#!/bin/bash
set -euo pipefail

stages=("Initialize" "Build Artifacts" "Deploy Containers")
total=${#stages[@]}

for i in "${!stages[@]}"; do
  step=$(( i + 1 ))
  echo "[STAGE ${step}/${total}] (Line ${LINENO}): ${stages[$i]}..."
done
Answer 11.19
Bash
#!/bin/bash
set -euo pipefail

token=$(head -c 8 /dev/urandom | xxd -p 2>/dev/null || printf "%04x%04x" "$RANDOM" "$RANDOM")
echo "Generated Deployment Token: ${token}"
Answer 11.20
Bash
#!/bin/bash
set -euo pipefail

raw_data="srv1.net\nsrv2.net\nsrv3.net"
readarray -t server_list < <(echo -e "${raw_data}")

echo "Loaded ${#server_list[@]} servers safely into array."
Answer 11.21
Bash
#!/bin/bash
set -euo pipefail

lock_file="/tmp/pipeline.lock"
echo "${HOSTNAME}:$$" > "${lock_file}"

trap 'rm -f "${lock_file}"' EXIT

read -r lock_host lock_pid <<< "$(tr ':' ' ' < "${lock_file}")"
echo "Lock acquired by ${lock_host} (PID ${lock_pid})"
Answer 11.22
Bash
#!/bin/bash
set -euo pipefail

mem_free=$(free -m | awk '/Mem:/ {print $7}')
disk_free=$(df / | awk 'NR==2 {print $4}')

echo "=== PRE-FLIGHT CHECK ==="
echo "Free Memory : ${mem_free} MB"
echo "Free Disk   : ${disk_free} KB"
Answer 11.23
Bash
#!/bin/bash
set -euo pipefail

default_env="dev"
cli_env="${1:-}"

final_env="${cli_env:-${default_env}}"
manifest=("env:${final_env}" "user:${USER}" "host:${HOSTNAME}")

echo "Final Manifest: ${manifest[*]}"
Answer 11.24
Bash
#!/bin/bash
set -euo pipefail

tasks=("task1" "task2" "task3" "task4")

for (( i=0; i<${#tasks[@]}; i+=2 )); do
  echo "Processing batch: ${tasks[i]} and ${tasks[i+1]:-N/A} at $(date +%T)"
done
Answer 11.25
Bash
#!/bin/bash
set -euo pipefail

start_ms=$(date +%s%3N)
sleep 0.1
end_ms=$(date +%s%3N)

delta=$(( end_ms - start_ms ))
echo "Pipeline execution runtime: ${delta} ms"