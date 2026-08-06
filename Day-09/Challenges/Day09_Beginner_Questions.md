📋 QUESTIONS (Day 09: Challenges 9.1 -- 9.35)🟢 Beginner (Challenges 9.1
-- 9.10)Challenge 9.1: Declare an indexed array servers=("web01" "db01"
"cache01") and print the second element (db01) using index selection
${servers[1]}.Challenge 9.2: Declare an array tools=("git" "docker" "kubernetes" "terraform") and iterate through all elements using a for tool in "${tools\[@\]}"
loop, printing each item.Challenge 9.3: Given an array
checklist=("disk_check" "ram_check" "cpu_check" "network_check"),
calculate and print its total length using \${#checklist\[@\]}.Challenge
9.4: Append a new element "monitoring" to an existing array
services=("nginx" "postgres") using services+=("monitoring").Challenge
9.5: Print the last element of an array nodes=("node-a" "node-b"
"node-c") dynamically using negative indexing
${nodes[-1]}.Challenge 9.6: Print all array elements on a single space-separated line using echo "${servers\[\*\]}".Challenge
9.7: Retrieve all active indices (keys) of an sparse array using
echo"\${!array\[@\]}".Challenge 9.8: Overwrite the first element (index
0) of ports=(8080 8081 8082) with value 9090.Challenge 9.9: Check if an
array is empty using if (( \${#array\[@\]} == 0 )).Challenge 9.10:
Declare an empty array declare -a dynamic_list and populate it with 3
values inside a basic for loop.
