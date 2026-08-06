🟡 Intermediate (Challenges 9.11 -- 9.25)Challenge 9.11: Write a script
that accepts multiple command-line arguments and stores all arguments
passed after $1 into a new array args=("${@:2}").Challenge 9.12: Slice
an array environments=("dev" "qa" "staging" "prod" "dr") to extract only
the middle 3 elements (qa, staging, prod) using
\${environments\[@\]:1:3}.Challenge 9.13: Write an array search function
contains_element that takes a target value
$1 and an array, returning exit code 0 if the value exists in the array or 1 if missing.Challenge 9.14: Read lines from a file hosts.txt directly into a Bash array using readarray -t hosts < hosts.txt (or mapfile).Challenge 9.15: Combine two separate arrays web_nodes=("web1" "web2") and db_nodes=("db1" "db2") into a unified array all_nodes=("${web_nodes\[@\]}"
"${db_nodes[@]}").Challenge 9.16: Delete a specific element at index 1 from array apps=("auth" "payment" "inventory") using unset 'apps[1]', and demonstrate how array length and indices behave afterward.Challenge 9.17: Convert a space-separated string raw_string="redis mongodb postgres" into an array without using eval.Challenge 9.18: Iterate over an array using index positions for i in "${!servers\[@\]}"
and print both the index and value (Index 0: web01).Challenge 9.19:
Filter an array of numbers scores=(45 88 92 67 30 100) to create a new
array passed_scores containing only values $\ge 70$.Challenge 9.20:
Execute a parallel-style ping check loop over an array of IP addresses
ips=("127.0.0.1" "8.8.8.8" "1.1.1.1"), tracking reachability status into
two separate arrays: online_ips and offline_ips.Challenge 9.21:
Transform all elements in an array services=("Nginx" "Docker" "Redis")
to lowercase using parameter expansion \${services\[@\],,}.Challenge
9.22: Find the longest string length among elements in an array
names=("api" "authentication-service" "db").Challenge 9.23: Reverse the
order of elements in an array letters=("A" "B" "C" "D") into a new array
reversed.Challenge 9.24: Write a function that takes an array name by
reference (local -n arr_ref="\$1") and modifies elements
in-place.Challenge 9.25: Remove duplicate entries from an un-sorted
array clusters=("us-east" "eu-west" "us-east" "ap-south" "eu-west").
