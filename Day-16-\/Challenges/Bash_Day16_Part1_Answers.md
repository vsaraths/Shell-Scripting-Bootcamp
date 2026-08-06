💡 ANSWERS & EXPLANATIONS Answer 16.1: Extracting Disk Usage
PercentageBash#!/bin/bash set -euo pipefail

# Extract usage % for root partition '/', stripping '%' sign

disk_usage=\$(df / \| awk 'NR==2 {print \$5}' \| tr -d '%')

echo "Root Partition Disk Usage: \${disk_usage}%" Everyday Analogy:
Reading a fuel gauge and extracting only the number reading.Line
Breakdown:df /: Checks root mount filesystem status.awk 'NR==2 {print
\$5}': Extracts 5th column value (Usage %) from second row.tr -d '%':
Strips % character leaving pure integer for comparisons.Answer 16.2:
Basic Disk Threshold AlertBash#!/bin/bash set -euo pipefail

threshold=80 disk_usage=\$(df / \| awk 'NR==2 {print \$5}' \| tr -d '%')

if (( disk_usage \> threshold )); then echo "\[CRITICAL\] Disk usage is
at \${disk_usage}% (Exceeds threshold of ${threshold}%)!" >&2
else
  echo "[OK] Disk usage is normal (${disk_usage}%)." fi Everyday
Analogy: Setting a low-fuel warning light on your dashboard when
capacity drops below 15%.Line Breakdown:(( disk_usage \> threshold )):
Arithmetic comparison evaluating integer thresholds.Answer 16.3:
Extracting Available MemoryBash#!/bin/bash set -euo pipefail

read -r total avail \<\<\< "\$(free -m \| awk 'NR==2 {print \$2, $7}')"
free_pct=$(awk -v t="${total}" -v a="${avail}" 'BEGIN {printf "%.1f",
(a/t)\*100}')

echo "Total RAM: \${total}MB \| Available: ${avail}MB (${free_pct}%
Free)" Everyday Analogy: Checking available credit limit on a card
compared to total credit limit.Line Breakdown:free -m: Outputs memory
figures in Megabytes.awk 'NR==2 {print \$2, \$7}': Grabs Total (Col 2)
and Available (Col 7) memory metrics.Answer 16.4: CPU Load Average
ProbeBash#!/bin/bash set -euo pipefail

load_1min=\$(awk '{print \$1}' /proc/loadavg) max_load="2.00"

if awk -v l="${load_1min}" -v m="${max_load}" 'BEGIN {exit !(l \> m)}';
then echo "\[WARNING\] High CPU Load Average (1-min): \${load_1min}
(Exceeds \${max_load})" \>&2 else echo "\[OK\] CPU Load Average:
\${load_1min}" fi Everyday Analogy: Checking if a highway toll gate has
a waiting queue line longer than 2 cars.Line Breakdown:/proc/loadavg:
Kernel interface containing system load averages.awk ... 'BEGIN {exit
!(l \> m)}': Handles floating-point numerical comparisons cleanly.Answer
16.5: HTTP Endpoint Health PingBash#!/bin/bash set -euo pipefail

check_http() { local url="$1"
  local status_code
  status_code=$(curl -s -o /dev/null -w"%{http_code}" --connect-timeout
5 "\${url}" \|\| echo "000")

if \[\[ "\${status_code}" == "200" \]\]; then echo "\[OK\] HTTP \${url}
returned 200" return 0 else echo "\[CRITICAL\] HTTP \${url} failed with
status: \${status_code}" \>&2 return 1 fi }

check_http "https://httpbin.org/status/200" Everyday Analogy:
Ping-calling a store phone number to verify if their customer service
desk is open.Line Breakdown:-w "%{http_code}": Extracts exact HTTP
response status code without printing payload body.Answer 16.6: Port
Connectivity Probe (nc / /dev/tcp)Bash#!/bin/bash set -euo pipefail

check_port() { local host="\$1" local port="\$2"

if timeout 2 bash -c "`</dev/tcp/${host}/${port}" 2>`{=html}/dev/null;
then echo"\[OK\] Connection to ${host}:${port} SUCCESSFUL" return 0 else
echo "\[CRITICAL\] Unable to reach ${host}:${port}" \>&2 return 1 fi }

check_port "127.0.0.1" "22" \|\| true Everyday Analogy: Knocks on a
specific door number to see if anyone answers.Line
Breakdown:`</dev/tcp/${host}/${port}: Bash built-in virtual device socket connection test.Answer 16.7: Process Execution Existence CheckBash#!/bin/bash
set -euo pipefail

check_process() {
  local proc_name="$1"
  if pgrep -x "${proc_name}">`{=html} /dev/null; then echo "\[OK\]
Process '\${proc_name}' is running under PID: $(pgrep -x "${proc_name}"
\| tr '`\n`{=tex}' ' ')" return 0 else echo "\[CRITICAL\] Process
'\${proc_name}' is NOT running!" \>&2 return 1 fi }

check_process "cron" Everyday Analogy: Security guard taking attendance
roll call to verify if key staff members are present at work.Line
Breakdown:pgrep -x: Searches for exact matching active process
names.Answer 16.8: System Uptime AlertBash#!/bin/bash set -euo pipefail

uptime_seconds=\$(awk '{print int($1)}' /proc/uptime)
uptime_hours=$(( uptime_seconds / 3600 ))

if (( uptime_hours \< 1 )); then echo "\[WARN\] System rebooted
recently! Uptime: \$(( uptime_seconds / 60 )) minutes." else echo
"\[OK\] System running stable. Uptime: \${uptime_hours} hours." fi
Everyday Analogy: Checking if a generator restarted within the last 60
minutes.Line Breakdown:/proc/uptime: Reads system uptime in seconds
directly from the kernel interface.Answer 16.9: Simple Periodic
Monitoring LoopBash#!/bin/bash set -euo pipefail

echo "Starting monitoring agent loop. Press Ctrl+C to stop."

for i in {1..3}; do ts=$(date +"%Y-%m-%d %H:%M:%S")
  echo "[${ts}\] Agent Heartbeat OK - Cycle \$i" sleep 2 done Everyday
Analogy: A security guard stamping a clock-in badge every 2 seconds
during a patrol.Line Breakdown:Uses sleep 2 inside a loop structure to
space out recurring checks.Answer 16.10: Appending Metrics to CSV Log
FileBash#!/bin/bash set -euo pipefail

csv_file="/tmp/system_metrics.csv"

# Write header if file does not exist

if \[\[ ! -f "${csv_file}" ]]; then
  echo "timestamp,cpu_load,disk_usage_pct" > "${csv_file}" fi

log_metric() { local ts cpu disk ts=$(date +"%Y-%m-%dT%H:%M:%S")
  cpu=$(awk '{print $1}' /proc/loadavg)
  disk=$(df / \| awk 'NR==2 {print \$5}' \| tr -d '%')

echo "${ts},${cpu},${disk}" >> "${csv_file}" echo "Metric logged to
\${csv_file}: ${ts},${cpu},\${disk}" }

log_metric Everyday Analogy: Appending a new row of temperature readings
into a logbook ledger sheet.Line Breakdown:Uses \>\> append redirection
operator to write metric data rows safely.Answer 16.11: Daemon PID
Lockfile GuardBash#!/bin/bash set -euo pipefail

PID_FILE="/tmp/health_agent.pid"

if \[\[ -f "${PID_FILE}" ]]; then
  existing_pid=$(cat"${PID_FILE}")
  if kill -0 "${existing_pid}" 2\>/dev/null; then echo "Error:
Monitoring agent already running under PID \${existing_pid}." \>&2 exit
1 fi fi

echo "$$" > "${PID_FILE}"
echo "Monitoring agent started under PID $$."

# Cleanup on exit

trap 'rm -f "${PID_FILE}"' EXIT
Everyday Analogy: Hanging an "In Use" sign on an office door containing your process ID number.Line Breakdown:kill -0 "${existing_pid}":
Verifies if the process ID is actively executing before blocking
duplicate runs.Answer 16.12: Graceful Monitoring Daemon
ShutdownBash#!/bin/bash set -euo pipefail

PID_FILE="/tmp/daemon_demo.pid" echo "\$$" > "${PID_FILE}"

cleanup() { echo -e "`\n[INFO] `{=tex}Signal received. Flushing metrics
and removing PID lockfile..." rm -f "\${PID_FILE}" echo "\[INFO\] Daemon
shutdown complete." exit 0 }

trap cleanup SIGINT SIGTERM

echo "Daemon active under PID \$\$. Sleeping..." sleep 5 Everyday
Analogy: An automated shutting-down sequence on a factory floor when
someone flips the power switch.Line Breakdown:trap cleanup SIGINT
SIGTERM: Intercepts kill and interrupt signals to trigger clean lock
removal.Answer 16.13: State File Alert DebouncingBash#!/bin/bash set
-euo pipefail

STATE_FILE="/tmp/disk_status.state" current_status="CRITICAL" \#
Simulated current evaluation status previous_status="OK"

if \[\[ -f "${STATE_FILE}" ]]; then
  previous_status=$(cat"\${STATE_FILE}") fi

if \[\[ "${current_status}" != "${previous_status}" \]\]; then echo
"STATE CHANGE DETECTED: \${previous_status} -\> \${current_status}" echo
"\>\>\> \[ALERT SENT\] Disk status is now ${current_status}! <<<"
  echo "${current_status}" \> "${STATE_FILE}"
else
  echo "Status unchanged (${current_status}). Skipping duplicate alert
notification." fi Everyday Analogy: Sending an SMS notification only
when a room temperature changes state from Normal to Overheated, rather
than sending a text every minute.Line Breakdown:Compares
\$current_status against persisted \$previous_status read from state
file.Answer 16.14: Formatting Alert NotificationsBash#!/bin/bash set
-euo pipefail

send_alert() { local severity="\$1" local component="\$2" local
message="$3"
  local hostname
  hostname=$(hostname) local ts ts=\$(date +"%Y-%m-%d %H:%M:%S")

echo -e "\\033\[1;31m========================================\\033\[0m"
echo -e "\\033\[1;31m SYSTEM ALERT: \[\${severity}\] \\033\[0m" echo "
Host : \${hostname}" echo " Time : \${ts}" echo " Component :
\${component}" echo " Details : \${message}" echo -e
"\\033\[1;31m========================================\\033\[0m" }

send_alert "CRITICAL" "Filesystem" "Root partition usage exceeded 92%!"
Everyday Analogy: Formatting an urgent red email alert notification
header for on-call engineers.Line Breakdown:Generates formatted alert
blocks with system headers and timestamps.Answer 16.15: System Metrics
Summary DashboardBash#!/bin/bash set -euo pipefail

get_dashboard() { local cpu_load mem_free disk_use cpu_load=\$(awk
'{print $1}' /proc/loadavg)
  mem_free=$(free -m \| awk 'NR==2 {printf "%.1f%%", (\$7/$2)*100}')
  disk_use=$(df / \| awk 'NR==2 {print \$5}')

echo "+---------------------------------------+" echo "\| SYSTEM HEALTH
DASHBOARD \|" echo "+---------------------------------------+" printf
"\| 1-Min CPU Load : %-17s \|`\n`{=tex}" "${cpu_load}"
  printf "| Available RAM %%   : %-17s |\n" "${mem_free}" printf "\|
Root Disk Usage : %-17s \|`\n`{=tex}" "\${disk_use}" echo
"+---------------------------------------+" }

get_dashboard Everyday Analogy: A flight cockpit status monitor
summarizing speed, altitude, and fuel status on a single screen.Line
Breakdown:Consolidates system queries into a formatted dashboard card.
