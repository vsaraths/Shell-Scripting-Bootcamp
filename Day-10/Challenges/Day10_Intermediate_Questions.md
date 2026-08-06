🟡 Intermediate (Challenges 10.11 -- 10.25) Challenge 10.11: Write an
automated log rotator script that rotates access.log to
access.log.\$(date +%Y%m%d\_%H%M%S) and recreates a fresh access.log.

Challenge 10.12: Write a multi-host ICMP ping scanner that iterates
through an array of 3 IP addresses, testing each with ping -c 1 -W 2 and
logging reachable vs unreachable hosts into separate arrays.

Challenge 10.13: Inspect the process tree for the running script using
ps -p \$\$ -o pid,ppid,cmd= and display runtime telemetry.

Challenge 10.14: Read system 1-minute load average from /proc/loadavg
using awk, multiply by 100 to convert to an integer, and evaluate if
load exceeds threshold 200 (equivalent to 2.00).

Challenge 10.15: Parse CLI options -h (host), -p (port), and -e
(environment) using getopts "h:p:e:" opt, assigning values to respective
variables.

Challenge 10.16: Build a database port auditor function verify_port that
checks if \$1 matches standard ports: 5432 (PostgreSQL), 3306 (MySQL),
or 6379 (Redis).

Challenge 10.17: Create a destructive directory cleaner with safety
switch: require both SAFE_MODE="OFF" AND an explicit --force flag before
running rm -rf.

Challenge 10.18: Monitor memory usage telemetry: capture available RAM
from free -m, calculate percentage used, and emit a warning if usage
exceeds 80%.

Challenge 10.19: Implement a PID collision check: before starting
execution, check if a PID file /tmp/app.pid exists AND the PID inside is
still actively running (kill -0 \$(cat /tmp/app.pid)).

Challenge 10.20: Extend getopts to handle invalid options using a
wildcard ? case branch that displays a structured help menu and exits
with status 1.

Challenge 10.21: Create an hourly log rotation cleaner: keep only the 3
most recent rotated log files matching app\_\*.log and remove older ones
using ls -t and array slicing.

Challenge 10.22: Check if a given socket port (e.g., 8080) is actively
listening on 127.0.0.1 using nc -z -w 1 127.0.0.1 8080 and checking \$?.

Challenge 10.23: Monitor process execution uptime: capture start time of
a target PID using ps -p `<pid>`{=html} -o etimes= and alert if process
has been running longer than 3600 seconds.

Challenge 10.24: Build a multi-flag CLI router that supports optional
flags -v (verbose mode toggle) and -f (file input path).

Challenge 10.25: Combine process inspection and telemetry: write a
function that queries RSS memory usage for current process PID (\$\$)
and prints a formatted memory consumption card.
