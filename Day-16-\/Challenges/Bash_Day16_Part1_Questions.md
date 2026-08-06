Welcome to Day 16: Building Health Checker Agents & System Monitors!This
is the final capstone module of your foundational practice track. Here,
you bring together system metric gathering (df, free, uptime, ping),
signal trapping, background execution, state management, and threshold
alert logic to build automated, production-grade monitoring agents and
daemon health checkers.💡 Core Concept BreakdownSystem Metric
Extraction:Disk Space (df -h): Extracting percentage usage and available
space for mounted filesystems.Memory Usage (free -m / vmstat):
Calculating total, used, and available RAM percentages.System Load &
Uptime (uptime / /proc/loadavg): Extracting 1-minute, 5-minute, and
15-minute load averages.Network & Service Probing (ping, curl, nc,
systemctl): Testing port reachability and HTTP status endpoints.Alert
Thresholds & State Tracking:Comparing dynamic metrics against predefined
thresholds (e.g., Disk \> 85%, CPU Load \> 4.0, Memory \>
90%).Preventing "alert fatigue" by maintaining state files
(/tmp/agent_state) to notify only when status changes (e.g., OK
$\rightarrow$ CRITICAL or CRITICAL $\rightarrow$
RECOVERED).Daemonization & Background Health Agents:Running non-blocking
background loops (while true; do ... sleep N; done &).Handling process
signals (SIGTERM, SIGINT) cleanly to remove PID lockfiles and flush
execution logs upon agent shutdown.📋 QUESTIONS (Beginner Challenges
16.1 -- 16.15)Challenge 16.1: Extracting Disk Usage PercentageScenario:
Write a script check_disk.sh that checks root partition (/) disk usage
using df -h and extracts ONLY the numeric percentage integer (e.g.,
75).Challenge 16.2: Basic Disk Threshold AlertScenario: Expand Challenge
16.1: if disk usage exceeds 80%, print "\[CRITICAL\] Disk usage is above
threshold!". Otherwise, print "\[OK\] Disk usage is normal.".Challenge
16.3: Extracting Available MemoryScenario: Parse free -m to extract the
available memory in Megabytes (MB) and calculate the percentage of free
memory relative to total memory using awk.Challenge 16.4: CPU Load
Average ProbeScenario: Read system load averages using /proc/loadavg or
uptime, extract the 1-minute load average, and compare it against a
limit of 2.0.Challenge 16.5: HTTP Endpoint Health PingScenario: Write a
function check_http that uses curl to test an HTTP endpoint URL (e.g.,
<https://httpbin.org/status/200>). If the status code is 200, return 0;
otherwise, return 1.Challenge 16.6: Port Connectivity Probe (nc /
/dev/tcp)Scenario: Check if a target server port (e.g., host 127.0.0.1,
port 22 or 80) is accepting TCP connections using Bash's built-in
/dev/tcp device check.Challenge 16.7: Process Execution Existence
CheckScenario: Write a script that checks if a specific daemon process
(e.g., nginx or sshd) is actively running using pgrep or ps.Challenge
16.8: System Uptime AlertScenario: Extract system uptime in hours using
uptime or /proc/uptime. If the machine has been running for less than 1
hour (recent reboot), log a warning flag.Challenge 16.9: Simple Periodic
Monitoring LoopScenario: Create an agent loop that runs every 5 seconds,
prints a timestamped system heartbeat message ("\[10:00:00\] Agent
Heartbeat OK"), and sleeps.Challenge 16.10: Appending Metrics to CSV Log
FileScenario: Build a logging function that appends system metrics
(timestamp,cpu_load,mem_used_pct,disk_used_pct) as a new CSV row inside
/tmp/system_metrics.csv.Challenge 16.11: Daemon PID Lockfile
GuardScenario: Ensure only one instance of your health monitoring agent
runs at a time by creating a PID lockfile at /var/run/health_agent.pid
(or /tmp/health_agent.pid).Challenge 16.12: Graceful Monitoring Daemon
ShutdownScenario: Register a signal trap on SIGINT and SIGTERM inside
your monitoring loop that removes the PID lockfile, logs "\[INFO\]
Health agent shutting down cleanly...", and exits.Challenge 16.13: State
File Alert DebouncingScenario: Create a simple state mechanism using a
state file /tmp/disk_status.state. Send an alert only when the system
transitions from OK to CRITICAL (not on every subsequent loop
iteration).Challenge 16.14: Formatting Alert NotificationsScenario:
Build an alert formatter function send_alert that formats critical
system alert messages with ANSI red text, timestamps, and hostname
headers.Challenge 16.15: System Metrics Summary DashboardScenario:
Combine CPU load, RAM usage, and Root Disk usage checks into a single
script that prints a clean multi-line system health dashboard card.
