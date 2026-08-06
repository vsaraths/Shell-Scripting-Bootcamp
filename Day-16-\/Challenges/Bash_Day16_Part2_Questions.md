These challenges focus on dynamic service checks, log rate anomaly
detection, threshold-driven automated remediations, state persistence,
and metrics export pipelines.

📋 QUESTIONS Challenge 16.16: Multi-Service TCP & HTTP Health Probe
Matrix Scenario: Build a function probe_matrix that takes a list of
endpoint strings formatted as service_name:host:port:path (e.g.,
web:127.0.0.1:80:/health, db:127.0.0.1:5432:). Iterate through the
matrix, execute TCP socket or HTTP checks, and output a status table (UP
/ DOWN).

Challenge 16.17: Threshold-Based Auto-Remediation Trigger Scenario:
Create a health monitoring check for a service process (e.g.,
redis-server or nginx). If the process is found to be DOWN, trigger an
automated restart command (or print an automated remediation action),
log the incident, and verify if the service recovered.

Challenge 16.18: Memory Leak & Swap Usage Threshold Monitor Scenario:
Write a monitor that calculates both RAM usage percentage and Swap space
usage. If RAM usage is above 85% and Swap usage exceeds 50%
simultaneously, emit a \[CRITICAL_MEMORY_EXHAUSTION\] alert.

Challenge 16.19: Log Error Rate Anomaly Detector Scenario: Monitor
/var/log/app.log (or a mock log) for rapid error spikes. Count how many
ERROR entries occurred in the last 60 seconds. If the error rate exceeds
10 errors/min, trigger an anomaly warning.

Challenge 16.20: Disk I/O & Load Correlation Inspector Scenario: Combine
CPU 1-minute load average checking with Disk I/O wait monitoring (iostat
or /proc/stat). If 1-minute load exceeds 3.0 and I/O wait is high,
classify the system bottleneck as \[I/O BOUND\] versus \[CPU BOUND\].

Challenge 16.21: Persistent State File Alert Flapping Guard Scenario:
Implement alert flap prevention inside a monitoring loop. If a check
alternates rapidly between OK and CRITICAL more than 3 times within 5
cycles, transition the state to \[FLAPPING\] and suppress duplicate
alert emails.

Challenge 16.22: Prometheus/OpenMetrics Format Exporter Scenario: Write
a metric conversion script that reads system stats (CPU, RAM, Disk) and
formats them into standard Prometheus text format key-value pairs
(node_cpu_load_1m 1.25, node_memory_free_bytes 524288000).

Challenge 16.23: SSL/TLS Certificate Expiry Checker Scenario: Write a
function check_ssl_expiry that connects to a domain (e.g.,
example.com:443) using openssl s_client, extracts the certificate
expiration date, calculates days remaining, and warns if expiration is
within 30 days.

Challenge 16.24: Dynamic Health Check Daemon with Hot Reload (SIGHUP)
Scenario: Create a background monitoring daemon that reads threshold
settings from agent.conf. Trap SIGHUP so that when kill -HUP
`<pid>`{=html} is sent, the daemon dynamically reloads configuration
variables without stopping or restarting the agent.

Challenge 16.25: Zombie & Defunct Process Detector Scenario: Search the
system process table for defunct/zombie processes (ps aux status Z). If
any zombie processes are detected, log their PIDs and parent process IDs
(PPID).
