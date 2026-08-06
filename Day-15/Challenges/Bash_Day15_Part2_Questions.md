📋 QUESTIONS Challenge 15.16: Multi-Flag Filter Engine Scenario: Create
a CLI script log_filter.sh that accepts options: -f `<logfile>`{=html}
(required file path), -l `<level>`{=html} (filter by log level: INFO,
WARN, ERROR), and -n `<count>`{=html} (limit output lines). Use getopts
to parse inputs and output matching lines using grep.

Challenge 15.17: Interactive Menu Log Parser with select Scenario: Build
an interactive CLI tool that prompts the user with a menu to analyze
app.log:

View Top 5 Errors

Count HTTP 4xx/5xx Responses

Search by Keyword

Exit

Handle menu selection using select and execute appropriate grep/awk
pipelines for each choice.

Challenge 15.18: Formatted KPI Summary Card Generation Scenario: Build a
function generate_kpi_card that reads an access log, calculates metric
totals (Total Requests, Error Rate, Avg Latency), and formats them
inside a clean ANSI-bordered terminal box card using printf.

Challenge 15.19: Dynamic Export Engine (--export / -e) Scenario: Extend
a log analyzer CLI script to support -e `<format>`{=html} (e.g., json or
txt). If -e txt is chosen, output standard report text. If -e json is
passed, transform the summary counts into valid JSON key-value format {
"total": 100, "errors": 5 }.

Challenge 15.20: Real-Time Stream Monitoring with Refresh Interval
Scenario: Build a CLI tool that accepts a refresh flag -i
`<seconds>`{=html} (default 2). It should continuously clear the
terminal screen (clear) and run a log tail aggregation pipeline every
\$i seconds until interrupted (Ctrl+C).

Challenge 15.21: Interactive Log Date Range Selector Scenario: Build a
CLI helper function prompt_date_range that asks the user interactively
for a Start Date (YYYY-MM-DD) and End Date (YYYY-MM-DD). Validate that
both inputs match the standard date format using regex before passing
them to awk.

Challenge 15.22: Subcommand Router Architecture (logtool analyze,
logtool export) Scenario: Create a CLI tool that uses subcommand pattern
routing (like docker or git commands). The script should evaluate \$1
for subcommands analyze or export and route execution to designated
functions.

Challenge 15.23: Dynamic Log Anonymizer/Sanitizer Flag (-s) Scenario:
Create a CLI flag -s (sanitize) that, when enabled, pipes analyzed log
output through sed to replace email addresses and IP addresses with
\[REDACTED\] before printing or saving.

Challenge 15.24: Multi-File Batch CLI Processing Scenario: Accept
multiple log files passed as trailing positional arguments after flags
(./analyzer.sh -l ERROR log1.log log2.log log3.log). Use shift after
getopts to process each log file sequentially, outputting per-file error
counts.

Challenge 15.25: CLI Configuration File Loader (\~/.logtoolrc) Scenario:
Write a CLI initialization function load_config that checks if a
configuration file \~/.logtoolrc exists. If present, source it to load
user default settings (e.g., DEFAULT_LOG_LEVEL="WARN"). Allow CLI flags
to override these loaded defaults.
