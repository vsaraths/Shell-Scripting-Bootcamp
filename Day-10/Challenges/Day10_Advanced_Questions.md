🔴 Advanced (Challenges 10.26 -- 10.35) Challenge 10.26: Build an
enterprise log rotator & compressor daemon: monitor app.log. When line
count exceeds 100, rotate to app\_\$(date +%Y%m%d\_%H%M%S).log, compress
using gzip, and enforce a max 5-archive retention limit.

Challenge 10.27: Construct an asynchronous multi-node ICMP health check
engine: ping 5 hosts in parallel subshells (ping ... &), collect exit
statuses using background PID tracking (\$!), and output a cluster
reachability matrix.

Challenge 10.28: Build a PID lock manager with stale lock recovery:
write an atomic lock handler that checks /tmp/app.lock. If the locking
process is dead (kill -0 fails), overwrite the stale lock with current
\$\$ and continue.

Challenge 10.29: Implement a full system telemetry collector: sample
1-min load, free RAM %, and root disk usage % every 2 seconds for 5
iterations, calculating running averages for all metrics.

Challenge 10.30: Build a robust CLI Option Router using getopts
supporting required options (-e `<env>`{=html}), optional flags (-v),
default value fallbacks (-p \[5432\]), and positional argument shift
synchronization (shift \$(( OPTIND - 1 ))).

Challenge 10.31: Build a strict port compliance scanner: parse a list of
running listening ports using ss -tuln or netstat, compare against an
approved port whitelist array (80 443 5432 22), and alert on unapproved
ports.

Challenge 10.32: Construct a Workspace Purge Safety Controller: accept a
target directory path \$1. Perform 4 safety validation steps: 1)
Non-empty path, 2) Path is not / or /home, 3) SAFE_MODE=OFF, 4) User
confirmation match.

Challenge 10.33: Implement an execution telemetry profiler wrapper:
launch a background worker process, monitor its PID (\$!) memory usage
every second, and log peak RSS memory consumption upon completion.

Challenge 10.34: Build a self-healing process supervisor loop: monitor a
target service PID. If process dies (\$? != 0), automatically execute a
restart callback, log the event with timestamp, and increment a restart
counter.

Challenge 10.35: Synthesis Capstone --- Enterprise System Process &
Telemetry Engine: parse CLI flags (-e, -p, -v, -s), acquire atomic PID
lock, run multi-node ping matrix, collect CPU/RAM/Disk telemetry,
validate database port compliance, enforce safety purge guards, and
produce an ANSI status report.
