💡 ANSWERS & EXPLANATIONS Answer 16.26: Production Health Monitoring
Daemon (node_sentinel.sh)Bash#!/bin/bash set -euo pipefail

PID_FILE="/tmp/node_sentinel.pid" CONF_FILE="/tmp/sentinel.conf"
LOG_FILE="/tmp/sentinel_telemetry.log"

CHECK_INTERVAL=5

# Initialize configuration if missing

if \[\[ ! -f "${CONF_FILE}" ]]; then
  echo "CHECK_INTERVAL=5" > "${CONF_FILE}" fi

# Acquire atomic lock

if \[\[ -f "${PID_FILE}" ]]; then
  old_pid=$(cat"${PID_FILE}")
  if kill -0 "${old_pid}" 2\>/dev/null; then echo "Error: Sentinel
daemon is already running under PID ${old_pid}." >&2
    exit 1
  fi
fi
echo "$$" > "${PID_FILE}"

cleanup() { echo -e "`\n[INFO] `{=tex}Stopping Node Sentinel Daemon (PID
\$$)..."
  rm -f "${PID_FILE}" echo "\[INFO\] Sentinel shutdown complete." exit 0
}

reload_config() { echo "\[CONFIG\] SIGHUP received. Reloading
${CONF_FILE}..."
  if [[ -f "${CONF_FILE}" \]\]; then \# shellcheck source=/dev/null
source "${CONF_FILE}"
    echo "[CONFIG] Updated CHECK_INTERVAL=${CHECK_INTERVAL}s" fi }

trap cleanup SIGINT SIGTERM trap reload_config SIGHUP

echo "\[INFO\] Sentinel daemon started under PID \$\$. Writing metrics
to \${LOG_FILE}..."

# Simulation loop (3 iterations for testing)

for (( cycle=1; cycle\<=3; cycle++ )); do
ts=$(date +"%Y-%m-%dT%H:%M:%S")
  load1=$(awk '{print $1}' /proc/loadavg)
  mem_pct=$(free \| awk'/Mem:/ {printf "%.1f", (\$3/$2)*100}')
  disk_pct=$(df / \| awk 'NR==2 {print \$5}' \| tr -d '%')

\# Write telemetry entry as JSON cat \<\< EOF \>\> "${LOG_FILE}"
{"timestamp":"${ts}","cycle":${cycle},"cpu_load_1m":${load1},"memory_used_pct":${mem_pct},"disk_used_pct":${disk_pct}}
EOF

echo "\[\${ts}\] Cycle \${cycle} metric logged. Sleeping
${CHECK_INTERVAL}s..."
  sleep "${CHECK_INTERVAL}" done

cleanup Everyday Analogy: A 24/7 building security console running
quietly in the basement, taking continuous sensor telemetry readings and
updating an electronic logbook.Line Breakdown:trap reload_config SIGHUP:
Intercepts SIGHUP signals to reload runtime configuration options
without killing the running background daemon.Formats unstructured
kernel and system data into a single structured JSON telemetry line on
every execution cycle.Answer 16.27: Multi-Service Auto-Remediation
Engine with BackoffBash#!/bin/bash set -euo pipefail

remediate_service() { local service="\$1" local max_attempts=3 local
delay=2

if pgrep -x "${service}" >/dev/null; then
    echo "[OK] Service '${service}' is healthy." return 0 fi

echo "\[WARN\] Service '\${service}' is DOWN! Initiating
auto-remediation sequence..." \>&2

for (( attempt=1; attempt\<=max_attempts; attempt++ )); do echo " -\>
Attempt ${attempt}/${max_attempts}: Restarting \${service} (waiting
${delay}s)..."
    # Simulated restart command: systemctl restart "${service}" sleep
"\${delay}"

    # Check recovery status (Simulating recovery on attempt 2 for demonstration)
    if (( attempt == 2 )) || pgrep -x "${service}" >/dev/null; then
      echo "[RECOVERED] Service '${service}' successfully restored on attempt ${attempt}!"
      return 0
    fi

    delay=$(( delay * 2 )) # Exponential backoff

done

echo "\[FATAL_SERVICE_FAILURE\] Auto-remediation failed for
'\${service}' after \${max_attempts} attempts!" \>&2 return 1 }

remediate_service "nginx" Everyday Analogy: An automated reboot feature
on a satellite transceiver: if a ping drops, it waits 2 seconds and
reboots; if still down, it waits 4 seconds, then 8 seconds before
throwing a hardware fault alarm.Line Breakdown:delay=\$(( delay \* 2 )):
Doubles the backoff delay between retry attempts to prevent hammering
overloaded services.Answer 16.28: Incident State Engine with Flapping
ProtectionBash#!/bin/bash set -euo pipefail

STATE_FILE="/tmp/sentinel_state.json"

# Default state if state file doesn't exist

if \[\[ ! -f "${STATE_FILE}" ]]; then
  echo '{"current_state":"OK","flap_count":0,"history":[]}' > "${STATE_FILE}"
fi

eval_state_transition() { local sampled_state="\$1" \# "OK" or
"CRITICAL"

\# Read current persisted state local last_state flap_count
last_state=$(grep -oP '"current_state":"\K[^"]+' "${STATE_FILE}" \|\|
echo "OK") flap_count=$(grep -oP '"flap_count":\K[0-9]+' "${STATE_FILE}"
\|\| echo "0")

if \[\[ "${sampled_state}" != "${last_state}" \]\]; then (( flap_count++
)) else if (( flap_count \> 0 )); then (( flap_count-- )); fi fi

if (( flap_count \>= 3 )); then echo "\[STATE: FLAPPING\] System status
oscillating rapidly (\${last_state} -\>
${sampled_state}). Alert notification suppressed." >&2
  elif [[ "${sampled_state}" != "${last_state}" ]]; then
    if [[ "${sampled_state}" == "CRITICAL" \]\]; then echo "\>\>\>
\[NOTIFICATION SENT\] Incident Triggered: Status changed
${last_state} -> CRITICAL! <<<"
    elif [[ "${sampled_state}" == "OK" &&
"${last_state}" == "CRITICAL" ]]; then
      echo ">>> [NOTIFICATION SENT] Incident Resolved: System RECOVERED to OK! <<<"
    fi
  else
    echo "[STATE: UNCHANGED] System remains in state '${sampled_state}'."
fi

\# Persist state cat \<\< EOF \> "${STATE_FILE}"
{"current_state":"${sampled_state}","flap_count":\${flap_count}} EOF }

eval_state_transition "CRITICAL" eval_state_transition "OK"
eval_state_transition "CRITICAL" Everyday Analogy: A smart home
thermostat that avoids sending repeated phone alerts if a door keeps
opening and closing rapidly, marking the sensor reading as
"oscillating."Line Breakdown:Tracks historical state transitions in
/tmp/sentinel_state.json and suppresses notifications when flap_count
\>= 3.Answer 16.29: Synthetic HTTP/Database Endpoint SLA & Latency
ProbeBash#!/bin/bash set -euo pipefail

probe_sla() { local target_url="\$1"

echo "Probing endpoint SLA latency for: \${target_url}"

local response_time \# Fetch HTTP response time in seconds
response_time=$(curl -s -o /dev/null -w "%{time_total}" --connect-timeout 3 "${target_url}"
\|\| echo "9.999")

\# Convert seconds to milliseconds using awk local ms
ms=$(awk -v t="${response_time}" 'BEGIN {printf "%d", t \* 1000}')

local sla_status="PASS" if (( ms \< 200 )); then sla_status="PASS" echo
"\[SLA OK\] Latency: \${ms}ms - Status: \${sla_status}" elif (( ms \<=
1000 )); then sla_status="DEGRADED" echo "\[SLA WARN\] Latency:
\${ms}ms - Status: \${sla_status}" \>&2 else sla_status="SLA_BREACH"
echo "\[SLA CRITICAL\] Latency: \${ms}ms - Status: \${sla_status}" \>&2
fi }

probe_sla "https://httpbin.org/delay/0" Everyday Analogy: A mystery
shopper visiting a bank teller with a stopwatch, grading the service as
Excellent (\<2 min), Slow (2-5 min), or Unacceptable (\>5 min).Line
Breakdown:curl -w "%{time_total}": Captures microsecond-accurate HTTP
response times and evaluates them against SLA boundary limits.Answer
16.30: Production Monitoring & Alerting Master AgentBash#!/bin/bash set
-euo pipefail

# Configuration Defaults

CONFIG_FILE="\${HOME}/.sysagentrc" DAEMON_MODE=false STATUS_MODE=false
LOCK_FILE="/tmp/sys_agent.lock"

RED='\\033\[0;31m' GREEN='\\033\[0;32m' YELLOW='\\033\[0;33m'
NC='\\033\[0m'

cleanup() { rm -f "\${LOCK_FILE}" } trap cleanup EXIT SIGINT SIGTERM

show_help() { cat \<\< EOF Usage: \$(basename "\$0") \[OPTIONS\]

Options: -s Display one-shot system health status card -d Run in
continuous background daemon mode -c `<file>`{=html} Specify custom
configuration file -h Display this help guide EOF }

while getopts ":sdc:h" opt; do case "${opt}" in
    s) STATUS_MODE=true ;;
    d) DAEMON_MODE=true ;;
    c) CONFIG_FILE="${OPTARG}" ;; h) show_help; exit 0 ;; ?) echo
"Error: Invalid option -\${OPTARG}" \>&2; show_help; exit 1 ;; esac done

# Acquire lock

if \[\[ -f "${LOCK_FILE}" ]]; then
  echo "Error: Master agent process is already active." >&2
  exit 1
fi
echo "$$" > "${LOCK_FILE}"

run_health_checks() { local cpu_load mem_pct disk_pct cpu_load=\$(awk
'{print $1}' /proc/loadavg)
  mem_pct=$(free \| awk'/Mem:/ {printf "%.1f", (\$3/$2)*100}')
  disk_pct=$(df / \| awk 'NR==2 {print \$5}' \| tr -d '%')

if "\${STATUS_MODE}"; then echo
"==========================================" echo " MASTER AGENT HEALTH
DASHBOARD " echo "==========================================" echo -e "
CPU Load (1m) : \${cpu_load}" echo -e " Memory Usage : \${mem_pct}%"
echo -e " Root Disk Usage : ${disk_pct}%"
    echo "=========================================="
  elif "${DAEMON_MODE}"; then local ts ts=$(date +"%Y-%m-%dT%H:%M:%S")
    echo "[${ts}\] TELEMETRY \| CPU: \${cpu_load} \| MEM: \${mem_pct}%
\| DISK: \${disk_pct}%" fi }

if "${STATUS_MODE}"; then
  run_health_checks
elif "${DAEMON_MODE}"; then echo "Starting SysAgent Daemon mode. Press
Ctrl+C to stop..." for (( i=1; i\<=2; i++ )); do run_health_checks sleep
2 done else show_help fi Everyday Analogy: An enterprise-grade
monitoring agent: accepts CLI flags, locks process execution, runs
single-pass status cards or continuous daemon telemetry, and cleans up
after itself.Line Breakdown:Combines getopts flag parsing, process lock
guards, signal traps, and metric extraction into a unified production
script architecture.🎓 Complete Track Graduation!Congratulations! You
have officially completed the entire 16-Day DevOps & Shell Scripting
Practice Track---from foundational permissions, variables, and
conditionals to advanced log parsing with grep, sed, and awk, strict
mode safety (set -euo pipefail), signal traps, CLI tool construction,
and automated health monitoring agents!
