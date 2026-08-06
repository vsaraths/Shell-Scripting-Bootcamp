🟡 Intermediate (Challenges 6.11 -- 6.25)Challenge 6.11: Write a safety
wrapper that attempts to ping a server host ($1). If ping fails ($? !=
0), retry once; if it fails again, log a critical error and exit with
status 1.Challenge 6.12: Create a weighted random load-balancer
simulator that picks between Primary (70% probability) and Fallback (30%
probability) using \$RANDOM.Challenge 6.13: Read memory metrics using
free -m. Calculate memory usage percentage and emit a \[CRITICAL\]
warning if memory usage exceeds 85%.Challenge 6.14: Write a script
parameter guard that verifies \$1 is a valid environment (dev, staging,
prod). If an invalid environment string is passed, exit with status
1.Challenge 6.15: Read a key-value configuration file app.conf
line-by-line, extract keys and values using \${line%%=*} and
${line#*=}, and export them as environment variables.Challenge 6.16: Combine readonly with declare: declare an immutable associative array or global config map declare -r CONFIG_PORT=8080 to protect critical system defaults.Challenge 6.17: Parse a colon-delimited string PATH variable line using IFS=":" into an array, checking each directory path for existence ([ -d "$dir"
\]).Challenge 6.18: Build a multi-threshold system monitor: check CPU
load, RAM usage, and Disk space. Print a green \[OK\] status card if all
metrics are below thresholds, or red warnings for any breached
metric.Challenge 6.19: Write a script that checks if a required tool
(e.g., curl or jq) is installed on the system using command -v
`<tool>`{=html}. If missing, exit gracefully with code 127.Challenge
6.20: Simulate a zero-downtime deployment check: attempt to query a
health endpoint 3 times. If all attempts fail (\$? != 0), trigger an
automated rollback status message.Challenge 6.21: Use \${var#*:\] and
\${var%:\*} to parse host and port from a input string
db.internal.net:5432 without calling external commands like cut or
awk.Challenge 6.22: Build a random port assignment guard: generate
random ports in a loop until a port is found that is NOT currently
listening/occupied.Challenge 6.23: Write a script that accepts flags (-e
for env, -v for version). Validate that mandatory flags are provided,
exit with code 1 if missing, and display a help menu.Challenge 6.24:
Build a configuration drift detector: compare runtime variables against
immutable readonly default configuration parameters and report any
discrepancies.Challenge 6.25: Create an interactive deployment dashboard
menu that runs system health checks, displays active safety guards, and
prompts the user for confirmation before deploying.
