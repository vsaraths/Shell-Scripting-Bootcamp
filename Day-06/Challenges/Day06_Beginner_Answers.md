🟢 Beginner Answers (6.1 -- 6.10)Answer 6.1Bash#!/bin/bash ls
/valid_path 2\>/dev/null status=\$?

if (( status != 0 )); then echo "Command failed with exit code $status"
else
  echo "Command succeeded"
fi
Answer 6.2Bash#!/bin/bash
index=$(( RANDOM % 3 + 1 ))

if (( index == 1 )); then echo "Routing traffic to Server 1 (Primary)"
elif (( index == 2 )); then echo "Routing traffic to Server 2
(Secondary)" else echo "Routing traffic to Server 3 (Backup)" fi Answer
6.3Bash#!/bin/bash disk_used=85

if (( disk_used \> 80 )); then echo "\[WARNING\] Disk usage high!
Currently at \${disk_used}%." fi Answer 6.4Bash#!/bin/bash if (( \$# ==
0 )); then echo "Error: No arguments provided!" \>&2 echo "Usage: \$0
`<environment_name>`{=html}" \>&2 exit 1 fi

echo "Deploying to environment: \$1" Answer 6.5Bash#!/bin/bash
servers="node1,node2,node3"

IFS="," for node in \$servers; do echo "Configuring cluster node:
\$node" done unset IFS Answer 6.6Bash#!/bin/bash
line="DB_HOST=localhost" \#
${line#*=} strips everything up to the first '='
value="${line#\*=}" echo "Extracted value: \$value" Answer
6.7Bash#!/bin/bash readonly DEPLOY_ENV="production" echo "Active
environment: \$DEPLOY_ENV"

# Attempting override will throw a Bash runtime error

# DEPLOY_ENV="staging" \# Uncommenting this triggers error: DEPLOY_ENV: readonly variable

Answer 6.8Bash#!/bin/bash target_dir="/tmp/test_dir"

mkdir -p "\$target_dir" if (( $? == 0 )); then
  cd "$target_dir" echo "Successfully navigated to \$(pwd)" else echo
"Failed to create directory \$target_dir" \>&2 exit 1 fi Answer
6.9Bash#!/bin/bash if (( \$# != 2 )); then echo "Error: Expected exactly
2 arguments, received \$#." \>&2 echo "Usage: \$0 `<user>`{=html}
`<role>`{=html}" \>&2 exit 2 fi

echo "User: \$1 \| Role: $2"
Answer 6.10Bash#!/bin/bash
# Formula: min + (RANDOM % (max - min + 1))
port=$(( 8000 + (RANDOM % 100) )) echo"Assigned dynamic port: \$port"
