🟡 Intermediate Answers (9.11 -- 9.25)Answer 9.11Bash#!/bin/bash if ((
\$# \< 2 )); then echo "Usage: \$0 `<primary_cmd>`{=html}
`<arg1>`{=html} `<arg2>`{=html} ..." \>&2 exit 1 fi

primary_cmd="$1"
extra_args=("${@:2}")

echo "Primary Command : \$primary_cmd" echo "Extra Arguments :
\${extra_args\[\*\]}" echo "Total Extra Args: \${#extra_args\[@\]}"
Answer 9.12Bash#!/bin/bash environments=("dev" "qa" "staging" "prod"
"dr")

# Syntax: ${array[@]:offset:length}
middle_tier=("${environments\[@\]:1:3}")

echo "Extracted Environments: \${middle_tier\[\*\]}" Answer
9.13Bash#!/bin/bash contains_element() { local search="$1"
  shift
  local element
  for element in "$@"; do \[\[ "$element" == "$search" \]\] && return 0
done return 1 }

nodes=("node01" "node02" "node03")

if contains_element "node02" "\${nodes\[@\]}"; then echo "Found node02
in list!" else echo "node02 not found!" fi Answer 9.14Bash#!/bin/bash
cat \<\< 'EOF' \> hosts.txt 10.0.0.1 10.0.0.2 10.0.0.3 EOF

readarray -t hosts \< hosts.txt

echo "Loaded \${#hosts\[@\]} hosts into array." echo "First Host :
\${hosts\[0\]}" echo "Last Host : \${hosts\[-1\]}"

rm -f hosts.txt Answer 9.15Bash#!/bin/bash web_nodes=("web1" "web2")
db_nodes=("db1" "db2")

all_nodes=("${web_nodes[@]}" "${db_nodes\[@\]}")

echo "Combined Cluster Nodes: \${all_nodes\[\*\]}" echo "Total Node
Count : \${#all_nodes\[@\]}" Answer 9.16Bash#!/bin/bash apps=("auth"
"payment" "inventory") echo "Original Apps : \${apps\[\*\]} (Count:
\${#apps\[@\]})"

unset 'apps\[1\]'

echo "After Unset : \${apps\[\*\]} (Count: \${#apps\[@\]})" echo "Active
Indices: \${!apps\[@\]}" Answer 9.17Bash#!/bin/bash raw_string="redis
mongodb postgres"

read -r -a service_array \<\<\< "\$raw_string"

echo "Array Element 0: \${service_array\[0\]}" echo "Array Element 1:
\${service_array\[1\]}" echo "Array Element 2: \${service_array\[2\]}"
Answer 9.18Bash#!/bin/bash servers=("web01" "db01" "cache01")

for i in "\${!servers\[@\]}"; do echo "Index \$i -\> Value:
${servers[$i\]}" done Answer 9.19Bash#!/bin/bash scores=(45 88 92 67 30
100) passed_scores=()

for score in "${scores[@]}"; do
  if (( score >= 70 )); then
    passed_scores+=("$score") fi done

echo "Passed Scores: \${passed_scores\[\*\]}" Answer 9.20Bash#!/bin/bash
ips=("127.0.0.1" "8.8.8.8" "192.0.2.1") \# 192.0.2.1 is documentation
non-routable IP online_ips=() offline_ips=()

for ip in "${ips[@]}"; do
  if ping -c 1 -W 1 "$ip" \>/dev/null 2\>&1; then online_ips+=("$ip")
  else
    offline_ips+=("$ip") fi done

echo "Online IPs : \${online_ips\[\*\]}" echo "Offline IPs :
${offline_ips[*]}"
Answer 9.21Bash#!/bin/bash
services=("Nginx" "Docker" "Redis")
lower_services=("${services\[@\],,}")

echo "Normalized Services: \${lower_services\[\*\]}" Answer
9.22Bash#!/bin/bash names=("api" "authentication-service" "db")
max_len=0 longest_name=""

for name in "${names[@]}"; do
  len=${#name} if (( len \> max_len )); then max_len=$len
    longest_name="$name" fi done

echo "Longest Name: '$longest_name' ($max_len characters)" Answer
9.23Bash#!/bin/bash letters=("A" "B" "C" "D") reversed=()

for (( i=${#letters[@]}-1; i>=0; i-- )); do
  reversed+=("${letters\[\$i\]}") done

echo "Original : \${letters\[\*\]}" echo "Reversed : \${reversed\[\*\]}"
Answer 9.24Bash#!/bin/bash add_prefix() { local -n arr_ref="\$1" local
prefix="\$2"

for i in "${!arr_ref[@]}"; do
    arr_ref[$i\]="${prefix}_${arr_ref\[\$i\]}" done }

my_servers=("web" "db" "cache") add_prefix my_servers "prod"

echo "Mutated Array: \${my_servers\[\*\]}" Answer 9.25Bash#!/bin/bash
clusters=("us-east" "eu-west" "us-east" "ap-south" "eu-west")
unique_clusters=()

for item in "${clusters[@]}"; do
  skip=0
  for u in "${unique_clusters\[@\]}"; do if \[\[ "$u" == "$item" \]\];
then skip=1 break fi done (( skip == 0 )) && unique_clusters+=("\$item")
done

echo "Unique Clusters: \${unique_clusters\[\*\]}"
