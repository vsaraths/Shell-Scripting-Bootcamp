💡 ANSWERS & EXPLANATIONS Answer 16.16: Multi-Service TCP & HTTP Health
Probe Matrix Bash #!/bin/bash set -euo pipefail

probe_matrix() { local matrix=("\$@")

printf "%-15s %-20s %-10s`\n`{=tex}" "SERVICE" "ENDPOINT" "STATUS"
printf "%-15s %-20s %-10s`\n`{=tex}" "-------" "--------" "------"

for entry in "${matrix[@]}"; do
    IFS=":" read -r name host port path <<< "${entry}" local
status="DOWN"

    if [[ -n "${path}" ]]; then
      # HTTP Check
      if curl -s -o /dev/null --connect-timeout 2 "http://${host}:${port}${path}"; then
        status="UP"
      fi
    else
      # TCP Socket Check
      if timeout 2 bash -c "</dev/tcp/${host}/${port}" 2>/dev/null; then
        status="UP"
      fi
    fi

    printf "%-15s %-20s %-10s\n" "${name}" "${host}:${port}${path}" "${status}"

done }

services=( "web:127.0.0.1:80:/" "ssh:127.0.0.1:22:"
"api:httpbin.org:80:/status/200" )

probe_matrix "\${services\[@\]}" Everyday Analogy: A security guard
running down a checklist of doors and windows, marking each as Locked or
Open on a master clipboard.

Line Breakdown:

IFS=":" read -r name host port path: Parses colon-separated endpoint
target elements.

Dynamically switches between HTTP curl checks and /dev/tcp socket checks
based on whether a path parameter exists.

Answer 16.17: Threshold-Based Auto-Remediation Trigger Bash #!/bin/bash
set -euo pipefail

check_and_remediate() { local service_name="\$1"

if ! pgrep -x "${service_name}" >/dev/null; then
    echo "[ALERT] Service '${service_name}' is DOWN! Initiating
auto-remediation..." \>&2 echo "\[REMEDIATION\] Attempting restart:
systemctl restart \${service_name} (Simulated)"

    # Simulate remediation recovery delay
    sleep 1

    if pgrep -x "${service_name}" >/dev/null; then
      echo "[RECOVERED] Service '${service_name}' successfully restored!"
    else
      echo "[CRITICAL] Auto-remediation failed! Service '${service_name}' is still DOWN!" >&2
      return 1
    fi

else echo "\[OK\] Service '\${service_name}' is running healthy." fi }

check_and_remediate "cron" Everyday Analogy: A smart circuit breaker
that trips, waits a second, attempts an automated self-reset, and alerts
maintenance only if the reset fails.

Line Breakdown:

Checks process state with pgrep, attempts automated restart execution
upon failure, and validates recovery state.

Answer 16.18: Memory Leak & Swap Usage Threshold Monitor Bash
#!/bin/bash set -euo pipefail

check_memory_and_swap() { local ram_used_pct swap_used_pct

ram_used_pct=\$(free \| awk '/Mem:/ {printf "%d", (\$3/$2)*100}')
  swap_used_pct=$(free \| awk'/Swap:/ {if (\$2\>0) printf "%d",
(\$3/\$2)\*100; else print 0}')

echo "RAM Usage: \${ram_used_pct}% \| Swap Usage: \${swap_used_pct}%"

if (( ram_used_pct \> 85 && swap_used_pct \> 50 )); then echo
"\[CRITICAL_MEMORY_EXHAUSTION\] High RAM
(${ram_used_pct}%) and Swap (${swap_used_pct}%) usage! Risk of OOM
killer!" \>&2 elif (( ram_used_pct \> 85 )); then echo "\[WARNING\] High
RAM usage detected (\${ram_used_pct}%)." else echo "\[OK\] Memory levels
within nominal thresholds." fi }

check_memory_and_swap Everyday Analogy: Checking both your main bank
account (RAM) and backup credit line (Swap); if both are nearly maxed
out, bankruptcy (OOM crash) is imminent.

Line Breakdown:

Evaluates combined multi-metric condition logic using (( ram_used_pct \>
85 && swap_used_pct \> 50 )).

Answer 16.19: Log Error Rate Anomaly Detector Bash #!/bin/bash set -euo
pipefail

detect_error_spike() { local log_file="\$1" local threshold=10

if \[\[ ! -f "\${log_file}" \]\]; then echo "Log file \${log_file} not
found. Skipping check." return 0 fi

\# Count error occurrences in the file local error_count
error_count=$(grep -c -i "ERROR" "${log_file}" \|\| true)

if (( error_count \> threshold )); then echo "\[ANOMALY DETECTED\] High
error frequency! \${error_count} errors found in \${log_file}
(Threshold: ${threshold})" >&2
  else
    echo "[OK] Error rate nominal (${error_count} errors)." fi }

# Example usage

detect_error_spike "/var/log/syslog" Everyday Analogy: A smoke detector
triggering an alarm when the density of smoke particles exceeds a safe
per-minute threshold.

Line Breakdown:

grep -c -i "ERROR": Aggregates matching error counts for rate
comparison.

Answer 16.20: Disk I/O & Load Correlation Inspector Bash #!/bin/bash set
-euo pipefail

analyze_bottleneck() { local load_1m load_1min=\$(awk '{print \$1}'
/proc/loadavg)

\# Check for high load if awk -v
l="${load_1min}" 'BEGIN {exit !(l > 3.0)}'; then
    # Inspect iowait percentage from top/vmstat or /proc/stat
    local iowait
    iowait=$(vmstat 1 2 \| tail -n 1 \| awk '{print \$16}')

    if (( iowait > 20 )); then
      echo "[BOTTLENECK: I/O BOUND] Load: ${load_1min}, IO Wait: ${iowait}% (Disk throughput saturated)"
    else
      echo "[BOTTLENECK: CPU BOUND] Load: ${load_1min}, IO Wait: ${iowait}% (CPU compute saturated)"
    fi

else echo "\[OK\] System load normal (\${load_1min})." fi }

analyze_bottleneck Everyday Analogy: Figuring out whether a traffic jam
is caused by a slow bridge toll gate (I/O bound) or too many cars trying
to accelerate at once (CPU bound).

Line Breakdown:

Evaluates /proc/loadavg alongside vmstat column 16 (wa / IO-wait) to
classify bottleneck root causes.

Answer 16.21: Persistent State File Alert Flapping Guard Bash
#!/bin/bash set -euo pipefail

STATE_FILE="/tmp/flap_guard.state"

# State File format: STATE:FLAP_COUNT

# Example: OK:0 or CRITICAL:4

check_flapping() { local current_check="\$1" \# "OK" or "CRITICAL" local
prev_state="OK" local flap_count=0

if \[\[ -f "${STATE_FILE}" ]]; then
    IFS=":" read -r prev_state flap_count < "${STATE_FILE}" fi

if \[\[ "${current_check}" != "${prev_state}" \]\]; then (( flap_count++
)) else flap_count=0 \# Reset flap count on stable state fi

if (( flap_count \>= 3 )); then echo "\[ALERT: FLAPPING\] Check state is
oscillating rapidly (\${prev_state} -\>
${current_check})! Suppressing notification." >&2
    echo "${current_check}:${flap_count}" > "${STATE_FILE}" else echo
"State transition: \${prev_state} -\> \${current_check} (Flap count:
${flap_count})"
    echo "${current_check}:${flap_count}" > "${STATE_FILE}" fi }

check_flapping "CRITICAL" Everyday Analogy: A car alarm that stops
ringing your phone if it trips on and off 5 times in 2 minutes due to a
passing gust of wind.

Line Breakdown:

Tracks historical state transitions and increments flap_count to detect
and suppress oscillating notifications.

Answer 16.22: Prometheus/OpenMetrics Format Exporter Bash #!/bin/bash
set -euo pipefail

export_prometheus_metrics() { local load_1m mem_total mem_avail disk_pct
load_1m=\$(awk '{print $1}' /proc/loadavg)
  read -r mem_total mem_avail <<< "$(free -b \| awk'/Mem:/ {print \$2,
$7}')"
  disk_pct=$(df / \| awk 'NR==2 {print \$5}' \| tr -d '%')

cat \<\< EOF \# HELP node_load1 1m load average \# TYPE node_load1 gauge
node_load1 \${load_1m}

# HELP node_memory_total_bytes Total physical memory in bytes

# TYPE node_memory_total_bytes gauge

node_memory_total_bytes \${mem_total}

# HELP node_memory_available_bytes Available memory in bytes

# TYPE node_memory_available_bytes gauge

node_memory_available_bytes \${mem_avail}

# HELP node_filesystem_usage_percent Root filesystem usage percentage

# TYPE node_filesystem_usage_percent gauge

node_filesystem_usage_percent \${disk_pct} EOF }

export_prometheus_metrics Everyday Analogy: Translating local gauge
readings into a standardized international electrical or metric units
format so any central monitoring hub can read it.

Line Breakdown:

Generates formatted key-value gauge telemetry blocks adhering to
OpenMetrics/Prometheus standards.

Answer 16.23: SSL/TLS Certificate Expiry Checker Bash #!/bin/bash set
-euo pipefail

check_ssl_expiry() { local domain="$1"
  local port="${2:-443}"

local expiry_date
expiry_date=$(timeout 5 openssl s_client -servername "${domain}"
-connect "${domain}:${port}" `</dev/null 2>`{=html}/dev/null \| openssl
x509 -noout -enddate \| cut -d= -f2 \|\| true)

if \[\[ -z "\${expiry_date}" \]\]; then echo "\[ERROR\] Unable to fetch
SSL certificate for ${domain}:${port}" \>&2 return 1 fi

local expiry_epoch target_epoch epoch_diff days_left
expiry_epoch=$(date -d "${expiry_date}" +%s) target_epoch=$(date +%s)
  days_left=$(( (expiry_epoch - target_epoch) / 86400 ))

if (( days_left \< 30 )); then echo "\[WARNING\] SSL Cert for \${domain}
expires in ${days_left} days (${expiry_date})!" \>&2 else echo "\[OK\]
SSL Cert for \${domain} is valid for \${days_left} more days." fi }

check_ssl_expiry "example.com" Everyday Analogy: Checking the expiration
date printed on a driver's license and setting a calendar reminder 30
days before it expires.

Line Breakdown:

Uses openssl s_client and x509 to extract certificate -enddate and
computes days remaining using Unix epoch calculations.

Answer 16.24: Dynamic Health Check Daemon with Hot Reload (SIGHUP) Bash
#!/bin/bash set -euo pipefail

CONF_FILE="/tmp/agent.conf"

# Write default configuration

echo "CHECK_INTERVAL=3" \> "\${CONF_FILE}"

load_config() { echo "\[CONFIG\] Reloading settings from
${CONF_FILE}..."
  # shellcheck source=/dev/null
  source "${CONF_FILE}" echo "\[CONFIG\] Active
CHECK_INTERVAL=\${CHECK_INTERVAL}s" }

trap load_config SIGHUP

load_config

echo "Daemon active under PID $$. Run 'kill -HUP $$' to trigger hot
reload." for i in {1..2}; do echo "\[DAEMON\] Running check cycle \$i
(Interval: ${CHECK_INTERVAL}s)..."
  sleep "${CHECK_INTERVAL}" done Everyday Analogy: Updating a
thermostat's target temperature while it is actively running without
turning off the entire heating unit.

Line Breakdown:

trap load_config SIGHUP: Intercepts SIGHUP signal to re-source
configuration variables dynamically at runtime.

Answer 16.25: Zombie & Defunct Process Detector Bash #!/bin/bash set
-euo pipefail

detect_zombies() { local zombies zombies=\$(ps -eo pid,ppid,state,cmd \|
awk '\$3 \~ /\^Z/ {print \$1, \$2, \$4}')

if \[\[ -n "${zombies}" ]]; then
    echo "[ALERT] Zombie/Defunct processes detected!" >&2
    echo "PID   PPID  COMMAND"
    echo "${zombies}" else echo "\[OK\] No zombie processes found in
system process table." fi }

detect_zombies Everyday Analogy: Walking through an office and checking
for terminated tasks that were never cleared off the master schedule
board.

Line Breakdown:

ps -eo pid,ppid,state,cmd: Inspects process status flags targeting
processes in Z (Zombie/Defunct) state.
