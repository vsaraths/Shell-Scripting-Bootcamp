# Intermediate Answers

🟡 Intermediate Answers (2.11 – 2.25)
Answer 2.11
Bash
#!/bin/bash
set -euo pipefail

API_KEY="${1:-}"

if [[ -z "${API_KEY:-}" ]]; then
  echo "CRITICAL: API_KEY is missing or empty!" >&2
else
  echo "API_KEY loaded successfully."
fi
Answer 2.12
Bash
#!/bin/bash
set -euo pipefail

ENV_STAGE=""

# ${var:-default} returns fallback without assigning
echo "Fallback check : ${ENV_STAGE:-staging}"
echo "ENV_STAGE value: '${ENV_STAGE}'"

# ${var:=default} permanently assigns fallback to variable
echo "Assign check   : ${ENV_STAGE:=staging}"
echo "ENV_STAGE value: '${ENV_STAGE}'"
Answer 2.13
Bash
#!/bin/bash
set -euo pipefail

readonly SYSTEM_MODE="READ_ONLY"
echo "System Mode: ${SYSTEM_MODE}"

# Attempting mutation triggers a fatal error
# SYSTEM_MODE="READ_WRITE" # Error: SYSTEM_MODE: readonly variable
Answer 2.14
Bash
#!/bin/bash
set -euo pipefail

CURRENT_USER=$(whoami)
CURRENT_HOST=$(hostname)

USER_HOST="${CURRENT_USER}@${CURRENT_HOST}"
echo "Connection Target: ${USER_HOST}"
Answer 2.15
Bash
#!/bin/bash
set -euo pipefail

LOCAL_VAR="secret_local"
export GLOBAL_VAR="shared_global"

echo "Parent Shell -> Local: ${LOCAL_VAR} | Global: ${GLOBAL_VAR}"

# Child subshell execution
bash -c 'echo "Child Subshell -> Local: [${LOCAL_VAR:-}] | Global: [${GLOBAL_VAR:-}]"'
Answer 2.16
Bash
#!/bin/bash
set -euo pipefail

SUMMARY=""

for i in {1..3}; do
  LOG_ENTRY="[$(date +'%T')] Log entry #${i}"
  if [[ -z "${SUMMARY}" ]]; then
    SUMMARY="${LOG_ENTRY}"
  else
    SUMMARY="${SUMMARY}"$'\n'"${LOG_ENTRY}"
  fi
done

echo "=== ACCUMULATED LOG SUMMARY ==="
echo "${SUMMARY}"
Answer 2.17
Bash
#!/bin/bash
set -euo pipefail

# Backslash \ escapes the dollar sign
echo "Literal Variable Syntax : \$HOME points to ${HOME}"
Answer 2.18
Bash
#!/bin/bash
set -euo pipefail

EMPTY_VAR=""

if [[ ! -v UNSET_VAR ]]; then
  echo "1. UNSET_VAR is completely UNDEFINED in environment (-v check)."
fi

if [[ -z "${EMPTY_VAR}" ]]; then
  echo "2. EMPTY_VAR is SET but has ZERO LENGTH (-z check)."
fi
Answer 2.19
Bash
#!/bin/bash
set -euo pipefail

RAW_INPUT="   admin_user   "
# Trim leading/trailing whitespace using xargs
CLEAN_INPUT=$(echo "${RAW_INPUT}" | xargs)

echo "Raw   : '${RAW_INPUT}'"
echo "Clean : '${CLEAN_INPUT}'"
Answer 2.20
Bash
#!/bin/bash
set -euo pipefail

process_task() {
  local INNER_VAR="local_value"
  echo "Inside function  : INNER_VAR = ${INNER_VAR}"
}

process_task
echo "Outside function : INNER_VAR = [${INNER_VAR:-}]"
Answer 2.21
Bash
#!/bin/bash
set -euo pipefail

declare -i COUNT=10
echo "Initial Integer : ${COUNT}"

COUNT+=5
echo "After += 5      : ${COUNT}"

# Non-numeric assignment evaluates to 0 in integer typing
COUNT="invalid_string"
echo "After String Assign : ${COUNT}"
Answer 2.22
Bash
#!/bin/bash
set -euo pipefail

declare -l LOWER_VAR
declare -u UPPER_VAR

LOWER_VAR="PRODUCTION_CLUSTER"
UPPER_VAR="developer_node"

echo "Auto Lowercase : ${LOWER_VAR}"
echo "Auto Uppercase : ${UPPER_VAR}"
Answer 2.23
Bash
#!/bin/bash
set -euo pipefail

read -r -d '' MULTI_LINE_MSG << 'EOF' || true
=== APPLICATION NOTICE ===
Line 1: Service initialized.
Line 2: Processing batch job.
Line 3: Shutdown complete.
EOF

echo "${MULTI_LINE_MSG}"
Answer 2.24
Bash
#!/bin/bash
set -euo pipefail

VAR="hello world"

# Quoting inside [[ ]] prevents word splitting errors
if [[ "${VAR}" == "hello world" ]]; then
  echo "Extended [[ ]]: Safely handles strings with spaces."
fi
Answer 2.25
Bash
#!/bin/bash
set -euo pipefail

batch_num=5
# Format integer with leading zeros into BATCH_ID without subshells
printf -v BATCH_ID "BATCH_%03d" "${batch_num}"

echo "Generated Batch Identifier: ${BATCH_ID}"