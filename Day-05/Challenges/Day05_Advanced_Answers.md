🔴 Advanced Answers (5.26 -- 5.35)Answer 5.26Bash#!/bin/bash set -euo
pipefail

log_file="app.log" max_lines=5 rotation_count=0

# Create initial log

:\> "\$log_file"

for i in {1..12}; do echo "\[\$(date +'%T')\] Log entry
$i" >> "$log_file" line_count=$(wc -l < "$log_file")

if \[ "$line_count" -ge "$max_lines" \]; then
timestamp=$(date +%Y%m%d_%H%M%S)
    rotated_file="app.log.${timestamp}" mv "$log_file" "$rotated_file"
:\> "\$log_file" ((rotation_count++)) echo "Rotated \$log_file -\>
\$rotated_file (Total rotations: $rotation_count)"
    rm -f "$rotated_file" \# Clean up demo fi done

rm -f "$log_file"
Answer 5.27Bash#!/bin/bash
# Batch rename via STDIN pipe
rename_batch() {
  while read -r filepath; do
    if [ -f "$filepath" \]; then dir=$(dirname "$filepath")
base=$(basename "$filepath") filename="${base%.*}"
      ext="${base##\*.}" ts=\$(date +%Y%m%d)

      new_name="${dir}/${filename}_${ts}.${ext}"
      echo "Renaming: $filepath -> $new_name"
    fi

done }

echo "test.txt" \| rename_batch Answer 5.28Bash#!/bin/bash max_retries=5
attempt=1 delay=1

echo "Connecting to remote cluster..." while \[ \$attempt -le
\$max_retries \]; do echo "Attempt \$attempt of \$max_retries (delay:
\${delay}s)..."

\# Simulate failure if \[ \$attempt -eq 4 \]; then echo "Connection
Successful!" break fi

sleep \$delay ((attempt++)) ((delay \*= 2)) \# Exponential backoff done

if \[ \$attempt -gt \$max_retries \]; then echo "Connection failed after
\$max_retries attempts!" \>&2 exit 1 fi Answer 5.29Bash#!/bin/bash
file_count=0 dir_count=0

walk_dir() { local current_dir="$1"
  for item in "$current_dir"/\* "$current_dir"/.*; do
    [ -e "$item" \] \|\| continue base=$(basename "$item") \[
"$base" = "." ] || [ "$base" = ".." \] && continue

    if [ -d "$item" ]; then
      ((dir_count++))
    elif [ -f "$item" ]; then
      ((file_count++))
    fi

done }

walk_dir "." echo "Scanned current folder: \$file_count file(s),
\$dir_count directory(ies)." Answer 5.30Bash#!/bin/bash \# Create dummy
CSV cat \<\< 'EOF' \> clusters.csv \# Cluster Configuration
cl_01,10.0.0.1,us-east \# Maintenance Node cl_02,10.0.0.2,eu-west

cl_03,10.0.0.3,ap-south EOF

while IFS=',' read -r cluster_id node_ip region \|\| \[ -n
"$cluster_id" ]; do
  # Skip comments and empty lines
  [[ "$cluster_id" =\~ [^1]\*# \]\] && continue \[\[ -z "\${cluster_id//
}" \]\] && continue

echo "Cluster ID : \$cluster_id \| IP: \$node_ip \| Region: \$region"
done \< clusters.csv

rm -f clusters.csv Answer 5.31Bash#!/bin/bash set -euo pipefail

target_dir="production_release" temp_dir="release.tmp.\$\$"

echo "Preparing atomic deployment..." mkdir -p "\$temp_dir"

# Populate build

echo "v1.0.0" \> "$temp_dir/version.txt"
echo "Build complete." > "$temp_dir/build.log"

# Atomic swap

mv -T "$temp_dir" "$target_dir" echo "Atomic deployment to \$target_dir
completed successfully!"

rm -rf "\$target_dir" Answer 5.32Bash#!/bin/bash minute=1 max_minutes=2
max_requests_per_min=3

while \[ \$minute -le \$max_minutes \]; do echo "--- Minute \$minute
---" req=1 while \[ \$req -le $max_requests_per_min ]; do
    echo "Processing Request #$req in Minute \$minute" ((req++)) done
((minute++)) done Answer 5.33Bash#!/bin/bash \# Generate dummy 12-line
data file seq 1 12 \> data.txt

batch_num=1 lines_per_batch=5

while \[ -s data.txt \]; do batch_file="batch\_\${batch_num}.txt" head
-n $lines_per_batch data.txt > "$batch_file"

\# Remove processed lines tail -n +\$((lines_per_batch + 1)) data.txt \>
data.tmp && mv data.tmp data.txt

echo "Created \$batch_file with $(wc -l < "$batch_file") lines." rm -f
"\$batch_file" ((batch_num++)) done

rm -f data.txt Answer 5.34Bash#!/bin/bash declare -A seen_paths
cleaned_path=""

IFS=":" read -r -a raw_paths \<\<\< "\$PATH"

for dir in "${raw_paths[@]}"; do
  [ -z "$dir" \] && continue if \[ -z "${seen_paths[$dir\]:-}" \]; then
seen_paths\["$dir"]=1
    if [ -z "$cleaned_path" \]; then cleaned_path="$dir"
    else
      cleaned_path="${cleaned_path}:\${dir}" fi fi done

echo "Cleaned PATH (duplicates removed):" echo "\$cleaned_path" Answer
5.35Bash#!/bin/bash set -euo pipefail

src_dir="${1:-.}"
dest_dir="${2:-/tmp/backups}" retention_limit=3

if \[ ! -d "$src_dir" ]; then
  echo "Error: Source directory '$src_dir' does not exist!" \>&2 exit 1
fi

mkdir -p "\$dest_dir"

timestamp=$(date +%Y%m%d_%H%M%S)
archive="${dest_dir}/backup\_\${timestamp}.tar.gz"

echo "Creating backup archive: $archive..."
tar -czf "$archive" "\$src_dir" 2\>/dev/null \|\| true

# Enforce retention policy

echo "Checking retention policy (Max: $retention_limit)..."
backups=($(ls -t"\${dest_dir}"/backup\_\*.tar.gz 2\>/dev/null \|\|
true))

if \[ \${#backups\[@\]} -gt $retention_limit ]; then
  for (( i=$retention_limit; i\<\${#backups\[@\]}; i++ )); do echo
"Removing old backup: ${backups[i]}"
    rm -f "${backups\[i\]}" done fi

echo "Backup process completed successfully.

[^1]: \[:space:\]
