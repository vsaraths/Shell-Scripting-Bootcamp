Welcome to Day 15: Building Capstone Log Analyzer CLI Tools!

Today we bring together everything you have mastered---text processing
(grep, sed, awk), defensive scripting (set -euo pipefail), functions,
local scope, and signal traps---to construct robust, user-friendly,
production-grade Command Line Interface (CLI) tools.

💡 Core Concept Breakdown CLI Flag & Option Parsing with getopts:

Standard Linux tools use option flags (-f file.log, -n 10, -v).

getopts "f:n:vh" opt is Bash's built-in flag parser:

A letter followed by a colon (f:) expects an argument (stored in
\$OPTARG).

A standalone letter (v, h) acts as a boolean flag.

Invalid options trigger ?, missing arguments trigger :.

Interactive User Menus & Prompt Logic:

select item in "Option 1" "Option 2" "Quit"; do ... done provides
standard interactive terminal navigation menus.

read -p "Enter path:" -r input_var captures user inputs cleanly and
safely.

Dynamic Report Generation & Terminal Formatting:

Reusable CLI outputs should support colored terminal logs (\\033\[31m
Red, \\033\[32m Green, \\033\[0m Reset).

Supports saving outputs to both the terminal screen and export files
(tee).

📋 QUESTIONS (Beginner Challenges 15.1 -- 15.15) Challenge 15.1: Basic
getopts Flag Parsing Scenario: Write a script cli_basic.sh that accepts
a single flag -f `<filename>`{=html} and prints "Target file specified:
`<filename>`{=html}". If -f is omitted, print a usage error message and
exit with status 1.

Challenge 15.2: Parsing Multiple CLI Flags Scenario: Create a script
that accepts two options: -f `<logfile>`{=html} (required file path) and
-n `<lines>`{=html} (optional number of lines to preview, default 5).
Print both values.

Challenge 15.3: Handling Boolean Flag Options Scenario: Extend a CLI
tool to accept a verbose boolean flag -v. If -v is provided, print
"\[VERBOSE MODE ENABLED\]". If omitted, run in quiet mode.

Challenge 15.4: Help Menu Auto-Generation (-h) Scenario: Add a -h flag
handler to a script that prints a formatted usage guide explaining all
valid options and exits with status 0.

Challenge 15.5: Handling Invalid Options & Missing Arguments Scenario:
Configure getopts in silent mode (getopts ":f:n:h" opt) to gracefully
display custom error messages when an unknown flag is provided or when a
flag is missing its required argument.

Challenge 15.6: Interactive Terminal Menu with select Scenario: Write a
script that presents an interactive numeric menu using select with
options: 1) Show Disk Usage, 2) Show System Uptime, 3) Exit.

Challenge 15.7: Prompting User Input with Defaults Scenario: Write a
prompt function that asks the user "Enter log directory \[/var/log\]:"
using read -p. If the user hits Enter without typing anything, fall back
to default value /var/log.

Challenge 15.8: Terminal Text Colorization Helper Scenario: Create two
utility functions log_success (prints green text) and log_error (prints
red text) using ANSI escape codes.

Challenge 15.9: Dual Output Routing (tee) Scenario: Write a CLI function
that prints log summary output to the stdout terminal screen while
simultaneously writing it into report.txt using tee.

Challenge 15.10: Positional Argument Shift after getopts Scenario: Use
shift \$((OPTIND - 1)) after processing getopts options so that
remaining non-flag arguments (like target file targets passed at the
end) can be processed as standard positional parameters (\$1, \$2).

Challenge 15.11: File Existence Validation Helper Scenario: Create a CLI
validator function validate_file that takes a file path passed via flag,
checks if it exists and is readable, and exits with status 1 if invalid.

Challenge 15.12: Exporting Reports with Custom Names Scenario: Add an
option -o `<output_file>`{=html} to a log parser script that redirects
generated analytical reports to the specified file path.

Challenge 15.13: Environment Variable Flag Defaults Scenario: Write a
script where the target log path defaults to the environment variable
\$LOG_PATH if -f is not explicitly provided on the CLI command line.

Challenge 15.14: CLI Exit Confirmation Prompt Scenario: Write an
interactive exit confirmation prompt using read -p "Are you sure you
want to exit? (y/N):" that exits only if the user types y or Y.

Challenge 15.15: Combining Options & Interactive Fallbacks Scenario:
Build a script that checks if log file path flag -f was provided. If
passed via CLI, use it directly; if omitted, switch to interactive mode
and prompt the user to type the file path.

💡 ANSWERS & EXPLANATIONS Answer 15.1: Basic getopts Flag Parsing Bash
#!/bin/bash set -euo pipefail

file_path=""

while getopts "f:" opt; do case "${opt}" in
    f) file_path="${OPTARG}" ;; \*) echo "Usage: \$0 -f
`<filename>`{=html}" \>&2; exit 1 ;; esac done

if \[\[ -z "\${file_path}" \]\]; then echo "Error: Option -f
`<filename>`{=html} is required." \>&2 exit 1 fi

echo "Target file specified: \${file_path}" Everyday Analogy: A
drive-thru menu teller checking for your specific order number flag
(-f).

Line Breakdown:

getopts "f:" opt: f: means flag -f expects an argument stored
automatically in \$OPTARG.

Answer 15.2: Parsing Multiple CLI Flags Bash #!/bin/bash set -euo
pipefail

logfile="" lines=5

while getopts "f:n:" opt; do case "${opt}" in
    f) logfile="${OPTARG}" ;; n) lines="\${OPTARG}" ;; \*) exit 1 ;;
esac done

echo "Parsing \${lines} lines from logfile: \${logfile}" Everyday
Analogy: Customizing a pizza order with size (-n 10) and topping (-f
pepperoni).

Line Breakdown:

f:n:: Defines two flags that both expect argument parameters.

Answer 15.3: Handling Boolean Flag Options Bash #!/bin/bash set -euo
pipefail

verbose=false

while getopts "v" opt; do case "\${opt}" in v) verbose=true ;; \*) exit
1 ;; esac done

if "\${verbose}"; then echo "\[VERBOSE MODE ENABLED\] Initializing
detailed diagnostics..." else echo "Running in standard mode." fi
Everyday Analogy: Flipping an ON/OFF light switch on a dashboard.

Line Breakdown:

v: Standalone letter without colon means boolean toggle flag without
parameter values.

Answer 15.4: Help Menu Auto-Generation (-h) Bash #!/bin/bash set -euo
pipefail

show_help() { cat \<\< EOF Usage: \$(basename "\$0") \[OPTIONS\]

Options: -f `<file>`{=html} Path to input log file (Required) -n
`<num>`{=html} Number of lines to process (Default: 10) -h Display this
help message EOF }

while getopts "f:n:h" opt; do case "\${opt}" in h) show_help; exit 0 ;;
\*) show_help; exit 1 ;; esac done Everyday Analogy: Reading the user
manual included inside an appliance box.

Line Breakdown:

cat \<\< EOF: Here-document block printing formatted help guide text to
terminal.

Answer 15.5: Handling Invalid Options & Missing Arguments Bash
#!/bin/bash set -euo pipefail

# Leading colon enables silent mode for custom error handling

while getopts ":f:h" opt; do case "\${opt}" in f) echo "File:
${OPTARG}" ;;
    h) echo "Help menu" ;;
    :) echo "Error: Flag -${OPTARG} requires an argument." \>&2; exit 1
;; ?) echo "Error: Invalid option -\${OPTARG}." \>&2; exit 1 ;; esac
done Everyday Analogy: A polite receptionist pointing out exactly which
field on a form was missed.

Line Breakdown:

Leading : in :f:h: Suppresses default getopts error output so custom
error handlers (:, ?) run.

Answer 15.6: Interactive Terminal Menu with select Bash #!/bin/bash set
-euo pipefail

PS3="Select an option (1-3):"

select opt in "Show Disk Usage" "Show System Uptime" "Exit"; do case
"\${REPLY}" in 1) df -h; break ;; 2) uptime; break ;; 3) echo
"Goodbye!"; exit 0 ;; \*) echo "Invalid option. Try again." ;; esac done
Everyday Analogy: An automated ATM menu asking you to press 1, 2, or 3
to select your transaction.

Line Breakdown:

PS3: Built-in prompt variable displayed by the select menu loop.

Answer 15.7: Prompting User Input with Defaults Bash #!/bin/bash set
-euo pipefail

read -p "Enter log directory \[/var/log\]:" -r user_dir
log_dir="\${user_dir:-/var/log}"

echo "Selected Directory: \${log_dir}" Everyday Analogy: Hitting "Enter"
to accept default installation folder paths in software setups.

Line Breakdown:

\${user_dir:-/var/log}: Falls back to /var/log if \$user_dir is empty.

Answer 15.8: Terminal Text Colorization Helper Bash #!/bin/bash set -euo
pipefail

RED='\\033\[0;31m' GREEN='\\033\[0;32m' NC='\\033\[0m' \# No Color /
Reset

log_success() { echo -e "\${GREEN}\[SUCCESS\] $1${NC}"; } log_error() {
echo -e "\${RED}\[ERROR\] $1${NC}" \>&2; }

log_success "Task completed!" log_error "Failed to write output!"
Everyday Analogy: Traffic lights using green for go and red for stop.

Line Breakdown:

\\033\[0;31m: ANSI escape sequence triggering red color text formatting.

Answer 15.9: Dual Output Routing (tee) Bash #!/bin/bash set -euo
pipefail

report_file="summary_report.txt"

generate_report() { echo "=================================" echo "
SYSTEM AUDIT REPORT " echo " Date: \$(date) " echo
"=================================" }

generate_report \| tee "\${report_file}" Everyday Analogy: Using a
carbon-copy paper pad to display a receipt on top while making a copy
underneath.

Line Breakdown:

tee: Duplicates standard input, writing one copy to stdout and another
to specified file path.

Answer 15.10: Positional Argument Shift after getopts Bash #!/bin/bash
set -euo pipefail

verbose=false

while getopts "v" opt; do case "\${opt}" in v) verbose=true ;; \*) exit
1 ;; esac done

shift \$(( OPTIND - 1 ))

echo "Remaining target file argument: \${1:-No file passed}" Everyday
Analogy: Clearing away processed ticket stubs so only remaining luggage
items are left on the counter.

Line Breakdown:

shift \$(( OPTIND - 1 )): Strips off all flag options processed by
getopts, resetting \$1 to target non-flag parameter.

Answer 15.11: File Existence Validation Helper Bash #!/bin/bash set -euo
pipefail

validate_file() { local target="$1"
  if [[ ! -f "${target}" \]\]; then echo "Error: Target file
'${target}' does not exist or is not a regular file." >&2
    return 1
  fi
  if [[ ! -r "${target}" \]\]; then echo "Error: Target file
'\${target}' is not readable." \>&2 return 1 fi return 0 }

# Example validation check call

validate_file "/etc/passwd" && echo "File check passed!" Everyday
Analogy: Checking if a passport exists and is valid before letting a
passenger onto a plane.

Line Breakdown:

-f and -r: File existence and read permission flags.

Answer 15.12: Exporting Reports with Custom Names Bash #!/bin/bash set
-euo pipefail

out_file=""

while getopts "o:" opt; do case "${opt}" in
    o) out_file="${OPTARG}" ;; \*) exit 1 ;; esac done

if \[\[ -n "\${out_file}" \]\]; then echo "Exporting execution report to
${out_file}..."
  date > "${out_file}" else echo "Displaying report on stdout screen:"
date fi Everyday Analogy: Choosing whether to print a receipt to paper
or display it on a digital screen.

Line Breakdown:

-n "\${out_file}": Tests if custom export filename flag was populated.

Answer 15.13: Environment Variable Flag Defaults Bash #!/bin/bash set
-euo pipefail

target_path="\${LOG_PATH:-/var/log/syslog}"

while getopts "f:" opt; do case "${opt}" in
    f) target_path="${OPTARG}" ;; \*) exit 1 ;; esac done

echo "Analyzing target log file at: \${target_path}" Everyday Analogy:
Driving along a default GPS route unless a detour flag is manually
selected.

Line Breakdown:

\${LOG_PATH:-/var/log/syslog}: Uses environment variable default if -f
is omitted.

Answer 15.14: CLI Exit Confirmation Prompt Bash #!/bin/bash set -euo
pipefail

confirm_exit() { read -p "Are you sure you want to exit CLI tool?
(y/N):" -r answer case "\${answer}" in \[yY\]\[eE\]\[sS\]\|\[yY\]) echo
"Exiting..."; exit 0 ;; \*) echo "Cancellation confirmed. Returning to
program." ;; esac }

confirm_exit Everyday Analogy: Pop-up window asking "Are you sure you
want to quit without saving?"

Line Breakdown:

\[yY\]\[eE\]\[sS\]\|\[yY\]: Regex pattern matching y, Y, yes, or YES.

Answer 15.15: Combining Options & Interactive Fallbacks Bash #!/bin/bash
set -euo pipefail

logfile=""

while getopts "f:" opt; do case "${opt}" in
    f) logfile="${OPTARG}" ;; \*) exit 1 ;; esac done

if \[\[ -z "\${logfile}" \]\]; then read -p "No log file flag passed.
Enter path interactively:" -r logfile fi

echo "Proceeding with analysis on target file: \${logfile}" Everyday
Analogy: Express lane at a store: if you have a digital pass (-f), walk
right in; if not, step up to the teller counter to enter details.

Line Breakdown:

Combines non-interactive CLI flag handling with interactive read
prompts.
