🔴 Advanced Answers (8.26 -- 8.35) Answer 8.26 Bash #!/bin/bash
app="${1:-}"
env="${2:-}" version="${3:-}"
region="${4:-}"

# Guard checks

if \[ -z "$app" ] || [ -z "$env" \] \|\| \[ -z
"$version" ] || [ -z "$region" \]; then echo "Error: Missing required
arguments!" \>&2 echo "Usage: \$0 `<app>`{=html} `<env>`{=html}
`<version>`{=html} `<region>`{=html}" \>&2 exit 1 fi

# Case conversions

APP_NAME="${app^^}"
ENV_NAME="${env\^\^}" REGION_NAME="\${region,,}"

echo "==========================================" echo " DEPLOYMENT
MANIFEST VALIDATED " echo " App : \$APP_NAME" echo " Env : \$ENV_NAME"
echo " Version : \$version" echo " Region : \$REGION_NAME" echo
"==========================================" Answer 8.27 Bash
#!/bin/bash cat \<\< 'EOF' \> .env \# Production Config
db_host=prod-db.internal \# Main DB db_port=5432 app_env=production EOF

echo "--- PARSED CONFIG REPORT ---" while read -r line \|\| \[ -n
"$line" ]; do
  [[ -z "$line" \|\| "\$line" =\~ [^1]\*# \]\] && continue

\# Strip inline comments clean_line="${line%%#*}"
  clean_line="$(echo"\$clean_line" \| xargs)"

key="${clean_line%%=*}"
  val="${clean_line#\*=}"

upper_key="\${key\^\^}" echo "KEY: \${upper_key} \| VALUE: \${val}" done
\< .env

rm -f .env Answer 8.28 Bash #!/bin/bash cat \<\< 'EOF' \> auth.log Aug 7
10:00:01 sshd: Failed password for root from 192.168.1.10 Aug 7 10:00:02
sshd: Failed password for invalid user admin from 10.0.0.5 Aug 7
10:00:03 sshd: Failed password for root from 192.168.1.10 Aug 7 10:00:04
sshd: Failed password for user1 from 10.0.0.5 Aug 7 10:00:05 sshd:
Failed password for root from 10.0.0.1 EOF

echo "Top Targeted Usernames:" grep -oP "Failed password for (invalid
user )?`\K`{=tex}`\S`{=tex}+" auth.log \| sort \| uniq -c \| sort -nr \|
head -n 3

rm -f auth.log Answer 8.29 Bash #!/bin/bash cat \<\< 'EOF' \> db.conf
host=localhost port=5432 user=postgres pass=secret123 EOF

declare -A required_keys=(\[HOST\]=0 \[PORT\]=0 \[USER\]=0 \[PASS\]=0)

while IFS="=" read -r key val \|\| \[ -n "$key" ]; do
  [[ -z "$key" \|\| "$key" =~ ^# ]] && continue
  upper_key="${key\^\^}" required_keys\[\$upper_key\]=1 echo "Loaded
${upper_key}=${val}" done \< db.conf

for k in "${!required_keys[@]}"; do
  if [ "${required_keys\[$k]}" -eq 0 ]; then
    echo "CRITICAL ERROR: Required configuration key '$k' is missing!"
\>&2 rm -f db.conf exit 1 fi done

echo "Configuration validation successful." rm -f db.conf Answer 8.30
Bash #!/bin/bash str="${1:-DevOps World}"
mode="${2:--u}"

case "$mode" in
  -u) echo "${str\^\^}" ;; -l) echo "${str,,}" ;;
  -c) echo "${str\^}" ;; -s) echo "\${str\~\~}" ;; \*) echo "Error:
Invalid flag \$mode. Options: -u, -l, -c, -s" \>&2; exit 1 ;; esac
Answer 8.31 Bash #!/bin/bash cat \<\< 'EOF' \> base.conf PORT=8080
ENV=staging TIMEOUT=30 EOF

cat \<\< 'EOF' \> override.conf env=production timeout=60 EOF

declare -A config

load_file() { local file="$1"
  while IFS="=" read -r key val || [ -n "$key" \]; do \[\[ -z
"$key" || "$key" =\~ \^# \]\] && continue upper_key="${key^^}"
    config[$upper_key\]="$val"
  done < "$file" }

load_file "base.conf" load_file "override.conf" \# Overrides previous
values

echo "Merged Configuration Settings:" for k in "\${!config\[@\]}"; do
echo " \$k = ${config[$k\]}" done

rm -f base.conf override.conf Answer 8.32 Bash #!/bin/bash cat \<\<
'EOF' \> audit.log 10:00:01 User logged in with Bearer
eyJhbGciOiJIUzI1NiJ9 10:00:05 Request sent with Bearer abc123secretToken
EOF

echo "Original Log Stream Sanitized:" while read -r line \|\| \[ -n
"$line" ]; do
  tokens=$(grep -oE"Bearer \[a-zA-Z0-9.\_-\]+" \<\<\< "$line" || true)
  if [ -n "$tokens" \]; then sanitized_line="\$line" for t in
$tokens; do
      sanitized_line="${sanitized_line//$t/Bearer [REDACTED]}"
    done
    echo "$sanitized_line" else echo "\$line" fi done \< audit.log

rm -f audit.log Answer 8.33 Bash #!/bin/bash cat \<\< 'EOF' \> data.csv
node1,us-east,active node2,eu-west,pending node3,ap-south,offline EOF

valid_rows=0

while IFS="," read -r node region status \|\| \[ -n "$node" ]; do
  # Input guard for empty columns
  if [ -z "$node" \] \|\| \[ -z "$region" ] || [ -z "$status" \]; then
echo "Warning: Skipping invalid row with missing columns!" \>&2 continue
fi

\# Transform to uppercase NODE_UPPER="${node^^}"
  REGION_UPPER="${region\^\^}" STATUS_UPPER="\${status\^\^}"

echo "Processed Row: Node=$NODE_UPPER | Region=$REGION_UPPER \|
Status=\$STATUS_UPPER" ((valid_rows++)) done \< data.csv

echo "Total Valid Rows Processed: \$valid_rows" rm -f data.csv Answer
8.34 Bash #!/bin/bash cat \<\< 'EOF' \> cluster.env cluster_id=cls-99012
region=us-west-2 node_limit=10 EOF

# Input guard

if \[ ! -s "cluster.env" \]; then echo "Error: Environment file
cluster.env is missing or empty!" \>&2 exit 1 fi

while IFS="=" read -r key val \|\| \[ -n "$key" ]; do
  [[ -z "$key" \|\| "$key" =~ ^# ]] && continue
  upper_key="${key\^\^}" declare -g "CONF\_${upper_key}=${val}" done \<
cluster.env

echo "Loaded Runtime Settings:" echo "Cluster ID : \$CONF_CLUSTER_ID"
echo "Region : \$CONF_REGION" echo "Node Limit : \$CONF_NODE_LIMIT"

rm -f cluster.env Answer 8.35 Bash #!/bin/bash set -euo pipefail

# Multi-Variable Input Guard

if \[ -z "${1:-}" ] || [ -z "${2:-}" \]; then echo "Error: Missing
required positional arguments!" \>&2 echo "Usage: \$0
`<app_name>`{=html} `<environment>`{=html}" \>&2 exit 1 fi

raw_app="\$1" raw_env="\$2"

# Native Case Transformers

APP_NAME="${raw_app^^}"
ENV_NAME="${raw_env,,}"

# Input Redirection File Source

cat \<\< 'EOF' \> cluster.txt node01 ONLINE node02 ONLINE node03
DEGRADED node04 ONLINE EOF

if \[ ! -s "cluster.txt" \]; then echo "Error: Cluster definition file
missing!" \>&2 exit 1 fi

# Pattern Extraction & Counting using grep -o

online_count=$(grep -o "ONLINE" cluster.txt | wc -l)
degraded_count=$(grep -o "DEGRADED" cluster.txt \| wc -l)

echo "==========================================" echo " ENTERPRISE
DEPLOYMENT MANIFEST " echo " Application : \$APP_NAME" echo "
Environment : \$ENV_NAME" echo " Online Nodes : \$online_count" echo "
Degraded Nodes : \$degraded_count" echo " Config Source : cluster.txt
(\< Redirection)" echo " Manifest Status : VALIDATED & READY" echo
"=========================================="

rm -f cluster.txt

[^1]: \[:space:\]
