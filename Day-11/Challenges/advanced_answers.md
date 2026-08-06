# Advanced Answers

🔴 Advanced Answers (11.26 – 11.35)
Answer 11.26
Bash
#!/bin/bash
set -euo pipefail

read -p "Enter Target App Name: " -r raw_app
clean_app="${raw_app//[^a-zA-Z0-9_-]/}"
norm_app="${clean_app^^}"

allowed=("AUTH" "PAYMENT" "INVENTORY")
valid=false

for item in "${allowed[@]}"; do
  if [[ "${item}" == "${norm_app}" ]]; then
    valid=true
    break
  fi
done

if "${valid}"; then
  echo "Input Validated: ${norm_app}"
else
  echo "Error: App '${norm_app}' is not in allowed list!" >&2
  exit 1
fi
Answer 11.27
Bash
#!/bin/bash
set -euo pipefail

tmp_dir=""

rollback() {
  local line="$1"
  echo "[ROLLBACK] Pipeline failed at line ${line}! Cleaning up..." >&2
  if [[ -n "${tmp_dir}" && -d "${tmp_dir}" ]]; then
    rm -rf "${tmp_dir}"
  fi
}

trap 'rollback $LINENO' ERR

tmp_dir=$(mktemp -d /tmp/pipeline_XXXXXX)
echo "[STEP 1] Workspace created at ${tmp_dir} (Line ${LINENO})"
echo "[STEP 2] Artifacts pulled (Line ${LINENO})"
echo "[STEP 3] Build verification completed (Line ${LINENO})"

rm -rf "${tmp_dir}"
Answer 11.28
Bash
#!/bin/bash
set -euo pipefail

nodes=("n1" "n2" "n3" "n4" "n5" "n6" "n7" "n8" "n9" "n10")
total=${#nodes[@]}

canary_count=$(( (total * 10) / 100 ))
(( canary_count == 0 )) && canary_count=1

canary_nodes=("${nodes[@]:0:canary_count}")
main_nodes=("${nodes[@]:canary_count}")

deploy_id="DEP-$(( 10000 + RANDOM % 90000 ))"

echo "Deployment ID : ${deploy_id}"
echo "Canary Group  : ${canary_nodes[*]}"
echo "Main Group    : ${main_nodes[*]}"
Answer 11.29
Bash
#!/bin/bash
set -euo pipefail

telemetry_file="/tmp/telemetry.json"

cat << EOF | tee "${telemetry_file}"
{
  "user": "${USER}",
  "host": "${HOSTNAME}",
  "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "load": "$(awk '{print $1}' /proc/loadavg)"
}
EOF

checksum=$(sha256sum "${telemetry_file}" | awk '{print $1}')
echo "Telemetry Integrity SHA256: ${checksum}"

rm -f "${telemetry_file}"
Answer 11.30
Bash
#!/bin/bash
set -euo pipefail

env=""
region="us-east-1"
verbose=false

while getopts "e:r:v" opt; do
  case "${opt}" in
    e) env="${OPTARG}" ;;
    r) region="${OPTARG}" ;;
    v) verbose=true ;;
    *) exit 1 ;;
  esac
done

shift $(( OPTIND - 1 ))

if [[ -z "${env}" ]]; then
  read -p "Enter Target Environment: " -r env
fi

echo "Pipeline Context -> Env: ${env^^} | Region: ${region} | Verbose: ${verbose}"
Answer 11.31
Bash
#!/bin/bash
set -euo pipefail

cluster=("node1.internal" "node2.internal")
csv_ledger="/tmp/transactions.csv"

echo "timestamp,node,status,attempts" > "${csv_ledger}"

for node in "${cluster[@]}"; do
  attempt=1
  success=false
  while (( attempt <= 3 )); do
    # Simulated connection check
    if ping -c 1 -W 1 "127.0.0.1" >/dev/null 2>&1; then
      success=true
      break
    fi
    (( attempt++ ))
  done

  ts=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  if "${success}"; then
    echo "${ts},${node},SUCCESS,${attempt}" >> "${csv_ledger}"
  else
    echo "${ts},${node},FAILED,${attempt}" >> "${csv_ledger}"
  fi
done

cat "${csv_ledger}"
rm -f "${csv_ledger}"
Answer 11.32
Bash
#!/bin/bash
set -euo pipefail

raw_manifest=(
  "auth_service:8080:active"
  "billing_service:8081:active"
  "cache_service:6379:degraded"
)

for entry in "${raw_manifest[@]}"; do
  svc="${entry%%:*}"
  rest="${entry#*:}"
  port="${rest%%:*}"
  status="${rest#*:}"

  echo "Service: ${svc^^} | Port: ${port} | Status: ${status^^}"
done
Answer 11.33
Bash
#!/bin/bash
set -euo pipefail

LOCK_FILE="/tmp/runner_$$.lock"
touch "${LOCK_FILE}"

cleanup() {
  echo -e "\n[SHUTDOWN] Signal/Exit caught. Cleaning lockfile ${LOCK_FILE}..."
  rm -f "${LOCK_FILE}"
}

trap cleanup EXIT SIGINT SIGTERM

echo "Pipeline Active under PID $$. Press Ctrl+C to test graceful shutdown."
sleep 1
Answer 11.34
Bash
#!/bin/bash
set -euo pipefail

tasks=("job1" "job2" "job3")
pids=()

for task in "${tasks[@]}"; do
  (
    sleep 0.2
    echo "Task ${task} completed under PID $$"
  ) &
  pids+=($!)
done

echo "Waiting for worker PIDs: ${pids[*]}..."
for pid in "${pids[@]}"; do
  wait "${pid}"
done

echo "All parallel pipeline tasks finished."
Answer 11.35: Synthesis Capstone — Grandmaster Enterprise Pipeline Simulator (challenge-55-enterprise-pipeline-simulator.sh)
Bash
#!/bin/bash
set -euo pipefail

# Enterprise Pipeline Simulator - Challenge 55
# Synthesis: Prompts, Random Tokens, Metadata, Traps, Arrays, and Reporting

# Default State
ENV=""
REGION="us-east-1"
VERBOSE=false
LOCK_FILE="/tmp/pipeline_c55_$$.lock"

# Cleanup Trap
cleanup() {
  local exit_code=$?
  if [[ -f "${LOCK_FILE}" ]]; then
    rm -f "${LOCK_FILE}"
  fi
  if (( exit_code != 0 )); then
    echo -e "\033[0;31m[CRITICAL] Pipeline aborted at line ${LINENO} with exit code ${exit_code}\033[0m" >&2
  fi
}
trap cleanup EXIT SIGINT SIGTERM

show_usage() {
  cat << EOF
Usage: $(basename "$0") [OPTIONS] [TARGET_NODES...]

Options:
  -e <env>      Target Environment (dev, staging, prod)
  -r <region>   AWS Region (Default: us-east-1)
  -v            Enable verbose output
  -h            Show help guide
EOF
}

while getopts "e:r:vh" opt; do
  case "${opt}" in
    e) ENV="${OPTARG}" ;;
    r) REGION="${OPTARG}" ;;
    v) VERBOSE=true ;;
    h) show_usage; exit 0 ;;
    *) show_usage; exit 1 ;;
  esac
done

shift $(( OPTIND - 1 ))

# Interactive Fallback for Environment
if [[ -z "${ENV}" ]]; then
  read -p "Enter Target Environment (dev/staging/prod) [staging]: " -r user_env
  ENV="${user_env:-staging}"
fi

ENV="${ENV^^}"

# Positional Targets Array
nodes=("$@")
if (( ${#nodes[@]} == 0 )); then
  nodes=("node-01.internal" "node-02.internal" "node-03.internal")
fi

# Lock Acquisition
echo "$$" > "${LOCK_FILE}"

# Metadata Synthesis
session_token="TOK-$(( 100000 + RANDOM % 900000 ))"
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

echo "=================================================="
echo "    ENTERPRISE PIPELINE SIMULATOR (C-55)          "
echo "=================================================="
echo " Session Token : ${session_token}"
echo " Timestamp     : ${timestamp}"
echo " Operator      : ${USER}@${HOSTNAME}"
echo " Environment   : ${ENV}"
echo " Region        : ${REGION}"
echo " Verbose Mode  : ${VERBOSE}"
echo " Active Lock   : ${LOCK_FILE}"
echo "=================================================="

# Cluster Matrix Processing
echo "Processing Cluster Target Nodes (${#nodes[@]} items):"
summary=()

for node in "${nodes[@]}"; do
  job_id="JOB-$(( 1000 + RANDOM % 9000 ))"
  echo "  -> Processing [${node}] | Assigned ${job_id} (Line ${LINENO})"
  summary+=("${node}:${job_id}:PASSED")
done

echo "=================================================="
echo "               EXECUTION SUMMARY                  "
echo "=================================================="
for item in "${summary[@]}"; do
  IFS=":" read -r n j s <<< "${item}"
  printf " Node: %-18s | Job: %-8s | Status: %s\n" "${n}" "${j}" "${s}"
done
echo "=================================================="
echo "Pipeline Execution Completed Successfully!"