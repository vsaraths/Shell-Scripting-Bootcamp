🟢 Beginner Answers (9.1 -- 9.10)Answer 9.1Bash#!/bin/bash
servers=("web01" "db01" "cache01") echo "Selected Server:
\${servers\[1\]}" Answer 9.2Bash#!/bin/bash tools=("git" "docker"
"kubernetes" "terraform")

echo "--- DevOps Tooling Stack ---" for tool in "\${tools\[@\]}"; do
echo " - Tool: \$tool" done Answer 9.3Bash#!/bin/bash
checklist=("disk_check" "ram_check" "cpu_check" "network_check") echo
"Total checklist items: \${#checklist\[@\]}" Answer 9.4Bash#!/bin/bash
services=("nginx" "postgres") services+=("monitoring")

echo "Updated Services: \${services\[\*\]}" Answer 9.5Bash#!/bin/bash
nodes=("node-a" "node-b" "node-c") echo "Last Node: \${nodes\[-1\]}"
Answer 9.6Bash#!/bin/bash servers=("web01" "db01" "cache01") echo "All
servers space-separated: \${servers\[\*\]}" Answer 9.7Bash#!/bin/bash
declare -a sparse_arr sparse_arr\[0\]="first" sparse_arr\[5\]="sixth"
sparse_arr\[10\]="eleventh"

echo "Active indices: \${!sparse_arr\[@\]}" Answer 9.8Bash#!/bin/bash
ports=(8080 8081 8082) ports\[0\]=9090

echo "Updated Ports: \${ports\[\*\]}" Answer 9.9Bash#!/bin/bash declare
-a empty_list=()

if (( \${#empty_list\[@\]} == 0 )); then echo "Collection is empty!" fi
Answer 9.10Bash#!/bin/bash declare -a dynamic_list=()

for i in {1..3}; do dynamic_list+=("item\_\$i") done

echo "Populated list: \${dynamic_list\[\*\]}"
