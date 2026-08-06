🟢 Beginner Answers (10.1 -- 10.10) Answer 10.1 Bash #!/bin/bash set
-euo pipefail

log_file="app\_$(date +%Y-%m-%d).log"
echo "[$(date +'%T')\] Initialized log session." \>\> "\${log_file}"
echo "Logged entry to: \${log_file}"

rm -f "\${log_file}" Answer 10.2 Bash #!/bin/bash set -euo pipefail

if ping -c 1 -W 2 "127.0.0.1" \>/dev/null 2\>&1; then echo "HOST_ONLINE"
else echo "HOST_OFFLINE" fi Answer 10.3 Bash #!/bin/bash set -euo
pipefail

pid_file="/tmp/app\_$$.pid"
echo "$$" \> "\${pid_file}" echo "Running under PID: \$\$ (Lockfile:
\${pid_file})"

rm -f "\${pid_file}" Answer 10.4 Bash #!/bin/bash set -euo pipefail

cpu_load=85

if (( cpu_load \> 80 )); then echo "\[CRITICAL\] CPU load threshold
breached: \${cpu_load}%" else echo "\[OK\] CPU load normal:
\${cpu_load}%" fi Answer 10.5 Bash #!/bin/bash set -euo pipefail

while getopts "p" opt; do case "\${opt}" in p) echo "Port check
requested" ;; \*) exit 1 ;; esac done Answer 10.6 Bash #!/bin/bash set
-euo pipefail

target_port=5432

if (( target_port == 5432 )); then echo "Compliant: PostgreSQL default
port (5432) in use." else echo "Non-standard port: \${target_port}" fi
Answer 10.7 Bash #!/bin/bash set -euo pipefail

SAFE_MODE="ON"

if \[\[ "\${SAFE_MODE}" == "ON" \]\]; then echo "Purge blocked by safety
mode!" exit 0 fi

echo "Purging workspace..." Answer 10.8 Bash #!/bin/bash set -euo
pipefail

echo "\[TELEMETRY\] Current PID: \$\$ \| Parent PID: \${PPID}" \>&2
Answer 10.9 Bash #!/bin/bash set -euo pipefail

lockfile="/tmp/job\_\$$.lock"
touch "${lockfile}"

trap 'rm -f "\${lockfile}"' EXIT

echo "Lockfile \${lockfile} created successfully." Answer 10.10 Bash
#!/bin/bash set -euo pipefail

port="\${1:-80}"

if (( port \< 1024 )); then echo "PORT_WARNING: Port \${port} is in the
privileged range (\< 1024)." else echo "PORT_OK: Port \${port} is an
unprivileged user port." fi
