🟡 Intermediate Answers (5.11 -- 5.25)Answer 5.11Bash#!/bin/bash for ((
i=1; i\<=10; i+=2 )); do echo "Odd number: \$i" done Answer
5.12Bash#!/bin/bash \# Create dummy file for demonstration echo -e
"10.0.0.1`\n10.0`{=tex}.0.2`\n10.0`{=tex}.0.3" \> servers.txt

while read -r line \|\| \[ -n "\$line" \]; do echo "Checking host:
\$line" done \< servers.txt

rm -f servers.txt Answer 5.13Bash#!/bin/bash ensure_dir() { local
target_dir="$1"
  if [ ! -d "$target_dir" \]; then echo "Directory
$target_dir missing. Creating recursively..."
    mkdir -p "$target_dir" else echo "Directory \$target_dir already
exists." fi }

ensure_dir "logs/app/2026" Answer 5.14Bash#!/bin/bash echo "Monitoring
process..." count=0 while true; do if ! pgrep "cron" \> /dev/null; then
echo "Process stopped!" break fi echo "Process running healthy..."
((count++)) if \[
$count -ge 3 ]; then break; fi # Exit simulation safety
  sleep 1
done
Answer 5.15Bash#!/bin/bash
today=$(date +%Y%m%d) i=1

while \[ $i -le 5 ]; do
  printf -v filename "audit_%s_%02d.log" "$today" "\$i" echo "Creating
batch file: $filename"
  touch "$filename" ((i++)) done

# Cleanup generated demo files

rm -f audit\_"${today}"_*.log
Answer 5.16Bash#!/bin/bash
IFS=":" read -r -a path_array <<< "$PATH"

for dir in "${path_array[@]}"; do
  if [ -d "$dir" \]; then echo "\[VALID\] \$dir" else echo "\[MISSING\]
\$dir" fi done Answer 5.17Bash#!/bin/bash secret="open-sesame" input=""

until \[ "$input" = "$secret" \]; do read -p "Enter passphrase:" input
if \[ "$input" != "$secret" \]; then echo "Access Denied. Try again!" fi
done echo "Access Granted! Welcome." Answer 5.18Bash#!/bin/bash
target="logs"

if \[ -d "$target" ]; then
  count=0
  for f in "$target"/\*.log; do \[ -e "\$f" \] && ((count++)) done echo
"Found \$count log file(s) in \$target." else echo "Directory missing.
Creating $target..."
  mkdir -p "$target" touch "$target/init.log"
fi
Answer 5.19Bash#!/bin/bash
num="${1:-5}" factorial=1 temp=\$num

while \[ \$temp -gt 1 \]; do ((factorial \*= temp)) ((temp--)) done

echo "Factorial of $num ($num!) is: \$factorial" Answer
5.20Bash#!/bin/bash i=0 while \[ \$i -lt 10 \]; do ((i++)) if \[ \$i -eq
5 \]; then echo "Skipping number 5..." continue fi if \[ \$i -eq 8 \];
then echo "Breaking loop at number 8!" break fi echo "Number: \$i" done
Answer 5.21Bash#!/bin/bash folders=("src" "config" "data")

# Create test dirs

mkdir -p src config

for folder in "${folders[@]}"; do
  if [ -d "$folder" \]; then echo "Archiving $folder..."
    tar -czf "${folder}\_backup.tar.gz" "$folder" 2>/dev/null
  else
    echo "Warning: Folder '$folder' does not exist. Skipping." fi done

# Cleanup

rm -rf src config \*\_backup.tar.gz Answer 5.22Bash#!/bin/bash \#
Process files safely even with spaces in names while IFS= read -r -d ''
file; do echo "Safely processing file: $file"
done < <(find . -maxdepth 1 -name "*.sh" -print0)
Answer 5.23Bash#!/bin/bash
lockfile="/tmp/app.lock"
touch "$lockfile" \# Simulating lock

timeout=5 elapsed=0

echo "Waiting for lockfile removal..." while \[ -f "\$lockfile" \]; do
if \[ \$elapsed -ge $timeout ]; then
    echo "Timeout reached ($timeout seconds)! Force aborting." break fi
sleep 1 ((elapsed++)) \# Remove lock on step 3 for simulation \[
$elapsed -eq 3 ] && rm -f "$lockfile" done

if \[ ! -f "\$lockfile" \]; then echo "Lock released after \$elapsed
seconds. Proceeding." fi Answer 5.24Bash#!/bin/bash if \[ \$# -lt 5 \];
then set -- 10 20 30 40 50 \# Default arguments fi

sum=0 count=0

for val in "\$@"; do ((sum += val)) ((count++)) done

((avg = sum / count)) echo "Total Sum: \$sum \| Average: $avg"
Answer 5.25Bash#!/bin/bash
target_dir="${1:-/non_existent_folder}"

if \[ ! -d "$target_dir" ]; then
  echo "Error: Directory '$target_dir' does not exist!" \>&2 exit 1 fi

echo "Disk Usage for $target_dir:"
du -sh "$target_dir"
