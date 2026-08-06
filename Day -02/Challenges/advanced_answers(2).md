# Advanced Answers

🔴 Advanced Answers (2.26 – 2.35)
Answer 2.26
Bash
#!/bin/bash
set -euo pipefail

SERVER_IP="192.168.1.100"
TARGET_VAR="SERVER_IP"

# Indirect variable expansion using nameref (${!var_name})
RESOLVED_VAL="${!TARGET_VAR}"

echo "Indirect Resolution of '${TARGET_VAR}' -> ${RESOLVED_VAL}"
Answer 2.27
Bash
#!/bin/bash
set -euo pipefail

SECRET="sk_live_1234567890abcdef"
LEN="${#SECRET}"

if (( LEN > 6 )); then
  PREFIX="${SECRET:0:3}"
  SUFFIX="${SECRET: -3}"
  MASK_LEN=$(( LEN - 6 ))
  
  printf -v PADDING '%*s' "${MASK_LEN}" ''
  ASTERISKS="${PADDING// /*}"
  
  MASKED_SECRET="${PREFIX}${ASTERISKS}${SUFFIX}"
  echo "Original Secret : ${SECRET}"
  echo "Masked Output   : ${MASKED_SECRET}"
fi
Answer 2.28
Bash
#!/bin/bash
set -euo pipefail # -u = nounset

# Under 'set -u', referencing $UNSET_VAR directly would crash the script.
# ${UNSET_VAR:-default} safely handles missing variables:
SAFE_VAL="${UNSET_VAR:-default_fallback}"

echo "Safe execution under set -u: ${SAFE_VAL}"
Answer 2.29
Bash
#!/bin/bash
set -euo pipefail

cat << 'EOF' > .env
DB_HOST="localhost"
DB_PORT='5432'
APP_ENV=production
EOF

while read -r line || [[ -n "${line}" ]]; do
  [[ -z "${line}" || "${line}" =~ ^# ]] && continue
  
  key="${line%%=*}"
  val="${line#*=}"
  
  # Strip surrounding quotes
  val="${val#\"}"
  val="${val%\"}"
  val="${val#\'}"
  val="${val%\'}"
  
  export "${key}=${val}"
  echo "Exported -> ${key} = ${val}"
done < .env

rm -f .env
Answer 2.30
Bash
#!/bin/bash
set -euo pipefail

# Immutable infrastructure constants
declare -r CONFIG_PORT=8080
declare -r CONFIG_ENV="production"
declare -r CONFIG_DB="prod_db"

echo "=== IMMUTABLE CONFIGURATION OBJECT ==="
echo " Port : ${CONFIG_PORT}"
echo " Env  : ${CONFIG_ENV}"
echo " DB   : ${CONFIG_DB}"
Answer 2.31
Bash
#!/bin/bash
set -euo pipefail

FULL_PATH="/usr/local/bin/python3"

# Zero-subshell parameter expansion
DIR_PATH="${FULL_PATH%/*}"
BINARY_NAME="${FULL_PATH##*/}"

echo "Full Path   : ${FULL_PATH}"
echo "Directory   : ${DIR_PATH}"
echo "Binary Name : ${BINARY_NAME}"
Answer 2.32
Bash
#!/bin/bash
set -euo pipefail

# Generate 5000 character test string
LARGE_VAR=$(printf 'X%.0s' {1..5000})
export LARGE_VAR

env_bytes=$(env | wc -c)
echo "Environment variable exported successfully."
echo "Total Environment Memory Payload Size: ${env_bytes} bytes"
Answer 2.33
Bash
#!/bin/bash
set -euo pipefail

COUNT=0

# Process substitution avoids child subshell pipeline isolation
while read -r line; do
  (( COUNT++ ))
done < <(printf "line1\nline2\nline3\n")

echo "Updated COUNT in parent shell: ${COUNT}"
Answer 2.34
Bash
#!/bin/bash
set -euo pipefail

TEMPLATE="Hello \${USER}, report generated on \${DATE}"

CURRENT_USER=$(whoami)
CURRENT_DATE=$(date +%Y-%m-%d)

# Render template by replacing placeholders
RENDERED="${TEMPLATE//\$\{USER\}/${CURRENT_USER}}"
RENDERED="${RENDERED//\$\{DATE\}/${CURRENT_DATE}}"

echo "Template Output: ${RENDERED}"
Answer 2.35: Synthesis Capstone — Variable Management & Safety Master
Bash
#!/bin/bash
set -euo pipefail

# Master Variable Management & Safety Suite

# Immutable System Locks
declare -r SCRIPT_NAME="${0##*/}"
declare -r RUNTIME_TS=$(date +"%Y-%m-%dT%H:%M:%S")

# Dynamic Fallback Parameters
APP_ENV="${1:-staging}"
APP_PORT="${2:-8080}"

# Function with isolated local scope
generate_diagnostic_card() {
  local env="$1"
  local port="$2"
  local user
  user=$(whoami)

  echo "=========================================="
  echo "    VARIABLE MANAGEMENT DIAGNOSTIC        "
  echo "=========================================="
  echo " Script Name : ${SCRIPT_NAME}"
  echo " Executed By : ${user}"
  echo " Timestamp   : ${RUNTIME_TS}"
  echo " Environment : ${env^^}"
  echo " Target Port : ${port}"
  echo "=========================================="
}

generate_diagnostic_card "${APP_ENV}" "${APP_PORT}"