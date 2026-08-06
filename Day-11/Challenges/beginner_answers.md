# Beginner Answers

🟢 Beginner Answers (11.1 – 11.10)
Answer 11.1
Bash
#!/bin/bash
set -euo pipefail

echo "User: ${USER} | Host: ${HOSTNAME} | Line: ${LINENO}"
Answer 11.2
Bash
#!/bin/bash
set -euo pipefail

session_id=$(( 1000 + RANDOM % 9000 ))
echo "Session ID: SESS-${session_id}"
Answer 11.3
Bash
#!/bin/bash
set -euo pipefail

timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
echo "UTC Timestamp: ${timestamp}"
Answer 11.4
Bash
#!/bin/bash
set -euo pipefail

read -p "Enter Target Region [us-east-1]: " -r user_region
target_region="${user_region:-us-east-1}"

echo "Selected Region: ${target_region}"
Answer 11.5
Bash
#!/bin/bash
set -euo pipefail

services=("auth" "billing" "shipping")

for svc in "${services[@]}"; do
  echo "Service Status: ${svc} -> ONLINE"
done
Answer 11.6
Bash
#!/bin/bash
set -euo pipefail

user="${USER}"
rand_id=$(( 100 + RANDOM % 900 ))
ts=$(date +%Y%m%d)

log_path="/tmp/deploy_${user}_${rand_id}_${ts}.log"
echo "Log file path constructed: ${log_path}"
Answer 11.7
Bash
#!/bin/bash
set -euo pipefail

echo "[LINE ${LINENO}] Initializing pipeline..."
# Task execution
echo "[LINE ${LINENO}] Finalizing pipeline execution..."
Answer 11.8
Bash
#!/bin/bash
set -euo pipefail

hosts=("node1.internal" "node2.internal" "node3.internal")
tmp_file="/tmp/hosts.tmp"

printf "%s\n" "${hosts[@]}" > "${tmp_file}"
echo "Wrote ${#hosts[@]} hosts to ${tmp_file}"

rm -f "${tmp_file}"
Answer 11.9
Bash
#!/bin/bash
set -euo pipefail

if (( $# == 0 )); then
  echo "Warning: No positional arguments passed to runner."
else
  echo "Received $# positional arguments: $*"
fi
Answer 11.10
Bash
#!/bin/bash
set -euo pipefail

echo "=========================================="
echo " RUNNER METADATA                          "
echo " User : ${USER}"
echo " Host : ${HOSTNAME}"
echo " Date : $(date)"
echo "=========================================="