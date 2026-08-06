These challenges simulate real-world, production-ready CLI
development---combining robust flag parsing (getopts), subcommand
routing, dynamic report generation, interactive fallbacks, and strict
mode defensive engineering into complete, standalone utilities.📋
QUESTIONSChallenge 15.26: Production Log Analyzer CLI
(logalyzer)Scenario: Build a complete, single-script CLI utility named
logalyzer that analyzes web server access logs.Requirements:Support
flags:-f `<file>`{=html}: Input log file (Required).-l `<level>`{=html}:
Filter entries by HTTP level/status (2xx, 4xx, 5xx, or keyword like
ERROR).-n `<num>`{=html}: Top $N$ entries to display (Default: 5).-o
```{=html}
<output>
```
: Save generated report to file path via tee.-v: Enable verbose debug
logging (\[DEBUG\]).-h: Print help menu and exit cleanly.Implement
strict mode (set -euo pipefail) and an EXIT trap to clean up any
temporary working files.Validate file existence and permissions before
execution.Challenge 15.27: Subcommand Architecture Log Management Suite
(cloudlog)Scenario: Create a modular CLI tool named cloudlog using
subcommand routing (e.g., cloudlog `<subcommand>`{=html}
\[options\]).Subcommands:cloudlog summary -f `<file>`{=html}: Generates
a overall log metric summary card (Total lines, unique IPs, error
count).cloudlog search -f `<file>`{=html} -k `<keyword>`{=html}:
Searches for matching entries with colorized output.cloudlog sanitize -f
`<file>`{=html} -o
```{=html}
<output>
```
: Redacts IP addresses and sensitive email values.Requirements: Display
a clear help menu if an invalid or missing subcommand is
supplied.Challenge 15.28: Multi-Format Log Report Generator with
JSON/CSV/Text ExportersScenario: Build an enterprise report generation
utility that parses unstructured log files and exports statistical
metrics into multiple user-selected formats.Requirements:Support -f
`<file>`{=html} and -t `<format>`{=html} (text, json, or csv).Calculate
total line count, total 4xx errors, total 5xx errors, and total unique
client IPs.Render valid, clean output for each format choice:text:
Formatted ANSI-bordered terminal box card.json: Valid JSON object
structure.csv: Standard CSV header and data row (Metric,Value).Challenge
15.29: Interactive Fail-Safe Incident Triaging CLIScenario: Build an
interactive CLI tool designed for on-call engineers responding to system
incidents.Requirements:If no log file is passed via -f, switch to an
interactive prompt prompting the user to select from available .log
files in /var/log or current directory.Present an interactive select
menu:1) Analyze Traffic Anomalies (Top 5 Requesting IPs)2) Extract
Critical Errors & Stack Traces3) Calculate Bandwidth Usage4)
ExitImplement a confirmation prompt before performing heavy processing
tasks.Challenge 15.30: Self-Updating Config-Driven CLI
FrameworkScenario: Build a flexible CLI utility that reads configuration
settings from \~/.logtoolrc (with default fallback values if missing),
parses command-line flag overrides, and executes log filtering with
error-handling traps.Requirements:Read default settings (LOG_FILE,
ALERT_EMAIL, MAX_LINES).Allow CLI flags (-f, -e, -n) to dynamically
override file and runtime variables.Emit colored terminal status
messages (\[INFO\], \[WARN\], \[ERROR\]).Write execution audit events to
a local runtime audit log (/tmp/cli_audit.log).
