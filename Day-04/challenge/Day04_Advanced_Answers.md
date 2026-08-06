🔴 Advanced Answers (4.26 -- 4.35)Answer 4.26Bash#!/bin/bash set -euo
pipefail

read -p "Enter Username:" user

while true; do read -s -p "Enter Password (min 8 chars):" pass1; echo ""
read -s -p "Confirm Password:" pass2; echo ""

if (( \${#pass1} \< 8 )); then echo "Error: Password must be at least 8
characters long! Try again." continue fi

if \[\[ "${pass1}" != "${pass2}" \]\]; then echo "Error: Passwords do
not match! Try again." continue fi

break done

echo "User '\${user}' registered successfully!" Answer
4.27Bash#!/bin/bash set -euo pipefail

conn_str="postgres://admin:secret123@db.internal:5432/prod_db"

# Pure parameter expansions (No subshells!)

proto="${conn_str%%://*}"
userpass_host="${conn_str#\*://}"

userpass="${userpass_host%%@*}"
user="${userpass%%:*}" pass="\${userpass#*:}"

hostport_db="${userpass_host#*@}"
db="${hostport_db#\*/}"

hostport="${hostport_db%%/*}"
host="${hostport%%:*}" port="\${hostport#*:}"

echo "Protocol : \${proto}" echo "User : \${user}" echo "Password :
\${pass}" echo "Host : \${host}" echo "Port : \${port}" echo "Database :
\${db}" Answer 4.28Bash#!/bin/bash set -euo pipefail

prompt_input() { local input="" echo "Initiating system deploy..." if
read -t 3 -r -p "Enter target environment \[staging\]:" input; then
TARGET_ENV="\${input:-staging}" else echo -e "`\n[TIMEOUT] `{=tex}No
input received within 3s." TARGET_ENV="staging" fi echo "Active Target:
\${TARGET_ENV}" }

prompt_input Answer 4.29Bash#!/bin/bash sanitize_filename() { local
raw="$1"
  # Replace spaces with underscores
  local no_spaces="${raw// /\_}" \# Convert to lowercase local
lower="${no_spaces,,}"
  # Remove special non-alphanumeric characters except dot/dash/underscore
  local clean="${lower//\[\^a-z0-9.\_-\]/}" echo "\${clean}" }

raw_input=" My Draft Report (v1.0) ! .PDF "
result=$(sanitize_filename "${raw_input}") echo"Sanitized: \${result}"
Answer 4.30Bash#!/bin/bash log_line="\[2026-08-07T10:15:30\] \[ERROR\]
Database connection failed on node01"

# Dynamically calculate offset of log level tag

start_offset=22 length=7

extracted_level="${log_line:${start_offset}:${length}}"
echo "Extracted Log Level: '${extracted_level}'" Answer
4.31Bash#!/bin/bash mask_api_key() { local key="$1"
  local len="${#key}"

if (( len \<= 8 )); then echo "Key too short to mask." return 1 fi

local prefix="${key:0:4}"
  local suffix="${key: -4}" local mask_len=\$(( len - 8 ))

\# Generate asterisks string dynamically printf -v padding '%*s'
"${mask_len}" ''
  local asterisks="${padding// /*}"

echo "${prefix}${asterisks}\${suffix}" }

mask_api_key "AKIAIOSFODNN7EXAMPLEKEY123456789" Answer
4.32Bash#!/bin/bash set -euo pipefail

url="https://staging.api.v1.domain.com:8443/v1/health"

proto="${url%%://*}"
rest="${url#\*://}"

hostport="${rest%%/*}"
path="/${rest#\*/}"

host="${hostport%%:*}"
port="${hostport#\*:}"

echo "Proto: \${proto} \| Host: \${host} \| Port: \${port} \| Path:
\${path}" Answer 4.33Bash#!/bin/bash set -euo pipefail

paths=( "/var/log/app/service1.txt" "/var/log/app/service2.txt"
"/var/log/app/service3.txt" )

for p in "${!paths[@]}"; do
  # Remove path prefix
  file="${paths\[p\]##\*/}" \# Swap .txt to .log using end-pattern
replacement new_file="\${file/%.txt/.log}" echo "Index \${p}:
\${paths\[p\]} -\> \${new_file}" done Answer 4.34Bash#!/bin/bash \# -e
enables Readline, -i pre-fills editable text into prompt read -e -i
"http://localhost:8080/health" -p "Confirm Health Check Endpoint:"
ENDPOINT echo "Final Endpoint Configured: \${ENDPOINT}" Answer
4.35Bash#!/bin/bash set -euo pipefail

echo "==========================================" echo " INTERACTIVE ENV
CONFIG GENERATOR " echo "=========================================="

read -p "Project Name:" raw_project project_clean="${raw_project// /_}"
PROJECT_NAME="${project_clean\^\^}"

read -p "Database Host \[localhost\]:" db_host
DB_HOST="\${db_host:-localhost}"

read -s -p "Database Password:" db_pass; echo ""
DB_PASS="\${db_pass:?Error: Database Password cannot be empty!}"

env_file=".env"

cat \<\< EOF \> "\${env_file}" \# Generated on $(date)
PROJECT_NAME=${PROJECT_NAME} DB_HOST=${DB_HOST}
DB_PASS=${DB_PASS} EOF

echo "Configuration successfully written to \${env_file}!"
