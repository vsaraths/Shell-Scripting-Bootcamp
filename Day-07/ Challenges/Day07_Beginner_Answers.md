🟢 Beginner Answers (7.1 -- 7.10)Answer 7.1Bash#!/bin/bash
current_time=\$(date) echo "System Time Marker: $current_time"
Answer 7.2Bash#!/bin/bash
file_count=$(ls -1 \| wc -l) echo"Total items in current folder:
$file_count"
Answer 7.3Bash#!/bin/bash
kernel=$(uname -r) echo "Active Kernel Version: $kernel"
Answer 7.4Bash#!/bin/bash
signal="${1:-Green}"

if \[\[ "$signal" == "Green" ]]; then
  echo "GO"
elif [[ "$signal" == "Yellow" \]\]; then echo "SLOW DOWN" elif \[\[
"$signal" == "Red" ]]; then
  echo "STOP"
else
  echo "INVALID SIGNAL"
fi
Answer 7.5Bash#!/bin/bash
num="${1:-25}"

if (( num \> 10 && num \< 50 )); then echo "SUCCESS: Number \$num is
inside bounds (10 \< \$num \< 50)" else echo "OUT OF BOUNDS: $num"
fi
Answer 7.6Bash#!/bin/bash
current_user=$(whoami)

if \[\[ "\$current_user" == "root" \]\]; then echo "Running with
administrative root privileges." else echo "Running as standard user:
$current_user"
fi
Answer 7.7Bash#!/bin/bash
current_dir=$(pwd) echo"Auditing Directory: $current_dir"
Answer 7.8Bash#!/bin/bash
score="${1:-85}"

if (( score \>= 90 )); then echo "Grade: A" elif (( score \>= 80 ));
then echo "Grade: B" elif (( score \>= 70 )); then echo "Grade: C" else
echo "Grade: F" fi Answer 7.9Bash#!/bin/bash num="\${1:-105}"

if (( num \< 0 \|\| num \> 100 )); then echo "ALERT: Value \$num is
outside the allowed range \[0-100\]" else echo "VALID: $num"
fi
Answer 7.10Bash#!/bin/bash
proc_count=$(ps aux \| wc -l) echo"Total Active Processes: \$proc_count"
