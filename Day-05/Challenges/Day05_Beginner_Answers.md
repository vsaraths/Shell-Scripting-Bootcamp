🟢 Beginner Answers (5.1 -- 5.10)Answer 5.1Bash#!/bin/bash counter=1
while \[ $counter -le 5 ]; do
  echo "High Five #$counter! 🖐️" ((counter++)) done Answer
5.2Bash#!/bin/bash timer=10 while \[ $timer -gt 0 ]; do
  echo "$timer..." ((timer--)) sleep 1 done echo "🚀 BLAST OFF!" Answer
5.3Bash#!/bin/bash base="\${1:-5}" multiplier=1

while \[ $multiplier -le 5 ]; do
  ((product = base * multiplier))
  echo "$base times \$multiplier equals \$product" ((multiplier++)) done
Answer 5.4Bash#!/bin/bash backup_folder="my_backups"

if \[ ! -d "\$backup_folder" \]; then echo "Directory
$backup_folder not found. Creating..."
  mkdir "$backup_folder" fi Answer 5.5Bash#!/bin/bash project="website"
version=2 timestamp=\$(date +%Y%m%d)

filename="${project}_v${version}\_\${timestamp}.tar.gz" echo "Generated
backup target: $filename"
Answer 5.6Bash#!/bin/bash
echo "--- System Binary Search Paths ---"
echo -e "${PATH//:/`\n`{=tex}}" Answer 5.7Bash#!/bin/bash num=1 until \[
\$num -gt 5 \]; do echo "Step \$num" ((num++)) done Answer
5.8Bash#!/bin/bash if \[ -f "app.log" \]; then echo "File found!" else
echo "File missing!" fi Answer 5.9Bash#!/bin/bash i=1 sum=0 while \[ \$i
-le 10 \]; do ((sum += i)) ((i++)) done echo "Sum of 1 to 10 is: $sum"
Answer 5.10Bash#!/bin/bash
for script in *.sh; do
  [ -e "$script" \] \|\| continue echo "\[SCRIPT\] Found: \$script" done
