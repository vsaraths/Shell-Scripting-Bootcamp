Here is a complete, structured set of 35 Challenges (10 Beginner, 15
Intermediate, and 10 Advanced) for Day 10: System Process & Telemetry.

This module covers dynamic log rotation naming, network status
validation via ping exit codes ($?), capturing active Process IDs ($\$),
monitoring runtime telemetry thresholds, parsing CLI options with
getopts, verifying configuration ports, and implementing conditional
safety switches (SAFE_MODE).

📋 QUESTIONS (Day 10: Challenges 10.1 -- 10.35) 🟢 Beginner (Challenges
10.1 -- 10.10) Challenge 10.1: Generate a dynamic log file rotation path
using log_file="app\_\$(date +%Y-%m-%d).log" and write an initial
timestamped entry to it.

Challenge 10.2: Ping a host (127.0.0.1) with a 1-packet count (ping
-c 1) and inspect \$? to output "HOST_ONLINE" or "HOST_OFFLINE".

Challenge 10.3: Print the current script's Process ID using
$$ and save it to a PID lockfile /tmp/app_$$.pid.

Challenge 10.4: Write a CPU load threshold evaluator: check cpu_load=85
and trigger a \[CRITICAL\] alert if (( cpu_load \> 80 )).

Challenge 10.5: Parse a simple CLI option flag -p using getopts "p" opt
and print "Port check requested" when passed.

Challenge 10.6: Verify if a database port variable target_port=5432
matches the PostgreSQL default using if (( target_port == 5432 )).

Challenge 10.7: Build a safety switch lock: check variable
SAFE_MODE="ON". If SAFE_MODE equals "ON", abort directory purge
operations with "Purge blocked by safety mode!".

Challenge 10.8: Read the current parent process ID using \$PPID and log
it to standard error.

Challenge 10.9: Create a dynamic lockfile named /tmp/job\_\$\$.lock on
script start and ensure it is removed on exit.

Challenge 10.10: Accept a port number as \$1 and check if it sits below
1024 (privileged port range) using if (( port \< 1024 )).
