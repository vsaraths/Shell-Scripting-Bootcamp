💡 ANSWERS & EXPLANATIONS Answer 15.16: Multi-Flag Filter Engine Bash
#!/bin/bash set -euo pipefail

logfile="" level="" count=""

while getopts ":f:l:n:" opt; do case "${opt}" in
    f) logfile="${OPTARG}" ;; l) level="${OPTARG}" ;;
    n) count="${OPTARG}" ;; :) echo "Error: Flag
-${OPTARG} requires an argument." >&2; exit 1 ;;
    \?) echo "Error: Invalid flag -${OPTARG}." \>&2; exit 1 ;; esac done

if \[\[ -z "${logfile}" || ! -f "${logfile}" \]\]; then echo "Error:
Valid log file path (-f) is required." \>&2 exit 1 fi

cmd=(grep) if \[\[ -n "${level}" ]]; then
  cmd+=("-E" "${level}") fi

if \[\[ -n "${count}" ]]; then
  "${cmd\[@\]}" "${logfile}" | head -n "${count}" else
"${cmd[@]}" "${logfile}" fi Everyday Analogy: Setting search filters on
a shopping site: selecting product category (-l), item limit (-n), and
store aisle (-f).

Line Breakdown:

cmd=(grep): Uses Bash array construction to dynamically assemble command
flags based on passed CLI options.

Answer 15.17: Interactive Menu Log Parser with select Bash #!/bin/bash
set -euo pipefail

logfile="\${1:-app.log}"

if \[\[ ! -f "${logfile}" ]]; then
  echo "Error: Log file '${logfile}' not found!" \>&2 exit 1 fi

PS3="Choose an analysis option (1-4):"

select choice in "View Top 5 Errors" "Count HTTP Errors" "Search
Keyword" "Exit"; do case "${REPLY}" in
    1)
      echo "--- TOP 5 ERRORS ---"
      grep -i "error" "${logfile}" \| sort \| uniq -c \| sort -nr \|
head -n 5 break ;; 2) echo "--- HTTP 4xx/5xx ERRORS ---" grep -E '
"\[45\]\[0-9\]{2} '"${logfile}" | wc -l
      break
      ;;
    3)
      read -p "Enter search keyword: " -r kw
      grep -i "${kw}" "\${logfile}" \|\| echo "No matches found." break
;; 4) echo "Exiting CLI tool." exit 0 ;; \*) echo "Invalid choice.
Select 1-4." ;; esac done Everyday Analogy: An interactive self-service
kiosk guiding a customer through specific options step-by-step.

Line Breakdown:

select choice in ...: Renders a numbered list and evaluates \$REPLY
choice.

Answer 15.18: Formatted KPI Summary Card Generation Bash #!/bin/bash set
-euo pipefail

generate_kpi_card() { local total_req="\$1" local total_err="\$2" local
avg_lat="\$3"

printf
"\\033\[1;34m+------------------------------------------+\\033\[0m`\n`{=tex}"
printf "\\033\[1;34m\| LOG ANALYSIS KPI SUMMARY \|\\033\[0m`\n`{=tex}"
printf
"\\033\[1;34m+------------------------------------------+\\033\[0m`\n`{=tex}"
printf "\| Total Requests Processed : %-13s \|`\n`{=tex}" "${total_req}"
  printf "| Total Errors Encountered : %-13s |\n" "${total_err}" printf
"\| Average Response Latency : %-13s \|`\n`{=tex}" "\${avg_lat}ms"
printf
"\\033\[1;34m+------------------------------------------+\\033\[0m`\n`{=tex}"
}

generate_kpi_card "10250" "42" "112.5" Everyday Analogy: A printed
receipt or ticket with formatted headers and aligned text columns.

Line Breakdown:

printf "\| ... %-13s \|": Uses left-aligned string formatting (%-13s) to
align box borders cleanly.

Answer 15.19: Dynamic Export Engine (--export / -e) Bash #!/bin/bash set
-euo pipefail

export_fmt="txt"

while getopts "e:" opt; do case "${opt}" in
    e) export_fmt="${OPTARG}" ;; \*) exit 1 ;; esac done

total_requests=1500 error_count=23

if \[\[ "\${export_fmt}" == "json" \]\]; then cat \<\< EOF { "summary":
{ "total_requests": \${total_requests}, "error_count": ${error_count}
  }
}
EOF
else
  echo "Report Summary: Total=${total_requests}, Errors=\${error_count}"
fi Everyday Analogy: Exporting a spreadsheet either as plain printable
text or structured JSON data for API consumers.

Line Breakdown:

Evaluates -e format parameter to switch output representation structure.

Answer 15.20: Real-Time Stream Monitoring with Refresh Interval Bash
#!/bin/bash set -euo pipefail

interval=2 logfile="access.log"

while getopts "i:f:" opt; do case "${opt}" in
    i) interval="${OPTARG}" ;; f) logfile="\${OPTARG}" ;; \*) exit 1 ;;
esac done

echo "Starting live monitor on \${logfile} (Refresh every
\${interval}s). Press Ctrl+C to stop." sleep 1

while true; do clear echo "=== LIVE LOG STREAM MONITOR
\[$(date +"%H:%M:%S")] ==="
  echo "Recent 5 Log Lines:"
  tail -n 5 "${logfile}" 2\>/dev/null \|\| echo "Waiting for log
entries..." sleep "\${interval}" done Everyday Analogy: A live flight
status monitor at an airport auto-refreshing its screen every few
seconds.

Line Breakdown:

clear: Clears current terminal window before writing updated status
frames.

Answer 15.21: Interactive Log Date Range Selector Bash #!/bin/bash set
-euo pipefail

prompt_date_range() { local date_regex='[^1]{4}-\[0-9\]{2}-\[0-9\]{2}\$'

read -p "Enter Start Date (YYYY-MM-DD):" -r start_date if \[\[ !
"\${start_date}" =\~ \${date_regex} \]\]; then echo "Error: Invalid
start date format!" \>&2 return 1 fi

read -p "Enter End Date (YYYY-MM-DD):" -r end_date if \[\[ !
"\${end_date}" =\~ \${date_regex} \]\]; then echo "Error: Invalid end
date format!" \>&2 return 1 fi

echo "Filtering logs between \${start_date} and \${end_date}..." }

prompt_date_range Everyday Analogy: Entering date filters on a travel
booking site and validating calendar format before searching flights.

Line Breakdown:

Answer 15.22: Subcommand Router Architecture (logtool analyze, logtool
export) Bash #!/bin/bash set -euo pipefail

do_analyze() { echo "\[ANALYZE\] Running system log diagnostics..." }

do_export() { echo "\[EXPORT\] Exporting system metrics to
report.csv..." }

show_usage() { echo "Usage: \$0 {analyze\|export} \[options\]" exit 1 }

subcommand="\${1:-}" shift \|\| show_usage

case "${subcommand}" in
  analyze) do_analyze "$@" ;; export) do_export "\$@" ;; \*) show_usage
;; esac Everyday Analogy: A universal tool handle where you snap on
different tool heads (analyze vs export) depending on the job.

Line Breakdown:

Inspects \$1 for subcommand routing and uses shift to pass remaining
parameters to target handler function.

Answer 15.23: Dynamic Log Anonymizer/Sanitizer Flag (-s) Bash
#!/bin/bash set -euo pipefail

sanitize=false logfile=""

while getopts "sf:" opt; do case "${opt}" in
    s) sanitize=true ;;
    f) logfile="${OPTARG}" ;; \*) exit 1 ;; esac done

if \[\[ -z "${logfile}" || ! -f "${logfile}" \]\]; then echo "Error: Log
file required (-f)." \>&2; exit 1 fi

if "${sanitize}"; then
  sed -E \
    -e 's/[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/[REDACTED_EMAIL]/g' \
    -e 's/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[REDACTED_IP]/g' \
    "${logfile}" else cat "\${logfile}" fi Everyday Analogy: Passing a
document through a privacy shredder/redactor that blacks out personal
identities before publication.

Line Breakdown:

Runs log text through sed regex substitutions when toggle boolean
\${sanitize} is true.

Answer 15.24: Multi-File Batch CLI Processing Bash #!/bin/bash set -euo
pipefail

target_level="ERROR"

while getopts "l:" opt; do case "${opt}" in
    l) target_level="${OPTARG}" ;; \*) exit 1 ;; esac done

shift \$(( OPTIND - 1 ))

if (( \$# == 0 )); then echo "Error: Pass at least one log file path as
an argument." \>&2 exit 1 fi

for file in "$@"; do
  if [[ -f "${file}" \]\]; then count=$(grep -c "${target_level}"
"\${file}" \|\| true) echo "File: \${file} \| \${target_level} Count:
\${count}" else echo "File: \${file} \| WARNING: File not found!" \>&2
fi done Everyday Analogy: A post worker scanning a stack of package
boxes one after another, stamping each with an inspection status.

Line Breakdown:

shift
$(( OPTIND - 1 )): Shifts processed flags out, letting for file in "$@"
process all remaining positional target arguments.

Answer 15.25: CLI Configuration File Loader (\~/.logtoolrc) Bash
#!/bin/bash set -euo pipefail

# Default setting

DEFAULT_LEVEL="INFO"

# Load config file if present

CONFIG_FILE="${HOME}/.logtoolrc"
if [[ -f "${CONFIG_FILE}" \]\]; then \# Source config file safely \#
shellcheck source=/dev/null source "\${CONFIG_FILE}" fi

target_level="\${DEFAULT_LEVEL}"

while getopts "l:" opt; do case "${opt}" in
    l) target_level="${OPTARG}" ;; \*) exit 1 ;; esac done

echo "Operating with active log level: \${target_level}" Everyday
Analogy: Loading custom preferences from your user profile while leaving
room to manually override settings for a single session.

Line Breakdown:

source "\${CONFIG_FILE}": Imports default variable configurations from
user configuration files before parsing CLI overrides.

[^1]: 0-9
