# Day 14 - Answers

💡 ANSWERS & EXPLANATIONS
Answer 14.1: Basic Function Declaration & Call
Bash
#!/bin/bash
greet_user() {
  local name="$1"
  echo "Hello, ${name}! Welcome to DevOps training."
}

greet_user "Alex"
Everyday Analogy: Defining a reusable recipe macro in a kitchen instruction manual.

Line Breakdown:

greet_user() { ... }: Function definition syntax.

$1: First positional parameter passed to function.

Answer 14.2: Function Return Codes (Exit Status)
Bash
#!/bin/bash
check_file_exists() {
  local file_path="$1"
  if [[ -f "$file_path" ]]; then
    return 0
  else
    return 1
  fi
}

check_file_exists "/tmp/test.txt" || echo "File missing!"
Everyday Analogy: A bouncer checking ID at a door: returning 0 (thumbs up, enter) or 1 (thumbs down, turned away).

Line Breakdown:

return 0 / return 1: Returns explicit status code (0–255) to $?.

Answer 14.3: Enforcing Local Scope (local)
Bash
#!/bin/bash
status="GLOBAL"

update_status() {
  local status="LOCAL"
  echo "Inside function: $status"
}

update_status
echo "Outside function: $status"
Everyday Analogy: Having a private notepad variable (local) inside an office cubicle that does not overwrite the master company bulletin board (global).

Line Breakdown:

local status="...": Restricts variable scope exclusively to function execution lifetime.

Answer 14.4: Function Argument Handling ($1, $2, $@)
Bash
#!/bin/bash
list_servers() {
  for server in "$@"; do
    echo "Server target: $server"
  done
}

list_servers "node01" "node02" "node03"
Everyday Analogy: Handing a list of package delivery addresses to a courier driver to process one by one.

Line Breakdown:

"$@": Expands to all positional parameters passed to function as separate quoted strings.

Answer 14.5: Capturing Function Output via Command Substitution
Bash
#!/bin/bash
calculate_disk_gb() {
  local mb="$1"
  echo $(( mb / 1024 ))
}

gb_result=$(calculate_disk_gb 2048)
echo "Converted Size: ${gb_result}GB"
Everyday Analogy: Passing raw numbers into a calculator machine and storing the calculated output on a post-it note.

Line Breakdown:

$(): Command substitution captures stdout printed by function.

Answer 14.6: Strict Mode - Unset Variables (set -u)
Bash
#!/bin/bash
set -u

echo "Starting script..."
echo "Value: $UNSET_VAR" # Script halts here with error: UNSET_VAR: unbound variable
echo "This line will never execute."
Everyday Analogy: A strict form validator refusing to submit a document if any mandatory blank field was left empty.

Line Breakdown:

set -u (or set -o nounset): Triggers script failure if an undefined variable is referenced.

Answer 14.7: Strict Mode - Error Exit (set -e)
Bash
#!/bin/bash
set -e

ls /non_existent_folder_path
echo "This should not run."
Everyday Analogy: An emergency circuit breaker tripping the moment a power surge is detected in a circuit.

Line Breakdown:

set -e (or set -o errexit): Instantly terminates script execution upon command error exit code.

Answer 14.8: Strict Mode - Pipeline Failures (set -o pipefail)
Bash
#!/bin/bash
set -o pipefail

cat non_existent_file.txt | grep "something"
echo "Exit code of pipeline: $?"
Everyday Analogy: An assembly line conveyor belt where a failure in station 1 halts the entire line, even if station 2 didn't notice.

Line Breakdown:

set -o pipefail: Configures pipeline exit code to return failure if ANY stage fails.

Answer 14.9: Basic Exit Signal Trap (trap ... EXIT)
Bash
#!/bin/bash
tmp_dir=$(mktemp -d)
echo "Created temp folder: $tmp_dir"

cleanup() {
  echo "Cleaning up temp folder $tmp_dir..."
  rm -rf "$tmp_dir"
}

trap cleanup EXIT

echo "Performing work inside script..."
Everyday Analogy: Setting an automatic room cleanup alarm that triggers when you walk out the exit door, regardless of how you leave.

Line Breakdown:

trap cleanup EXIT: Executes cleanup function whenever script exits (normally or via error).

Answer 14.10: Catching Ctrl+C Interrupts (SIGINT)
Bash
#!/bin/bash
handle_interrupt() {
  echo -e "\n[!] SIGINT received. Gracefully shutting down..."
  exit 130
}

trap handle_interrupt SIGINT

echo "Running loop... Press Ctrl+C to test interrupt."
sleep 10
Everyday Analogy: Hitting an emergency stop button on heavy machinery and triggering an orderly shutdown sequence.

Line Breakdown:

trap ... SIGINT: Intercepts Ctrl+C interrupt signal sent to script process.

Answer 14.11: Handling Function Failure with || return
Bash
#!/bin/bash
backup_database() {
  cd /non_existent_path || { echo "Directory not found!"; return 1; }
  echo "Backing up..."
}

backup_database
echo "Script execution continues outside function."
Everyday Analogy: Aborting a specific subsystem check and returning to main system diagnostics without crashing the entire plant.

Line Breakdown:

|| return 1: Returns failure code from function if target command fails.

Answer 14.12: Passing Arrays to Functions
Bash
#!/bin/bash
process_ports() {
  local ports=("$@")
  for port in "${ports[@]}"; do
    echo "Configuring firewall port: $port"
  done
}

my_ports=(80 443 8080)
process_ports "${my_ports[@]}"
Everyday Analogy: Unpacking a box of items handed to a worker and handling each item inside sequentially.

Line Breakdown:

"${my_ports[@]}": Unpacks array into individual positional arguments passed to function.

Answer 14.13: Catching Script Errors (trap ... ERR)
Bash
#!/bin/bash
on_error() {
  echo "[ERROR] Failed at line $1 with exit code $2"
}

trap 'on_error $LINENO $?' ERR

# Intentional command failure
ls /invalid_directory
Everyday Analogy: Flight data recorder (black box) recording the precise altitude and system error code at the moment of failure.

Line Breakdown:

trap ... ERR: Catches non-zero command execution returns.

$LINENO: Built-in Bash variable representing current executing line number.

Answer 14.14: Environment Variables vs. Function Parameters
Bash
#!/bin/bash
deploy_app() {
  local target_env="${DEPLOY_ENV:-staging}"
  echo "Deploying application to environment: $target_env"
}

deploy_app # Uses default "staging"
DEPLOY_ENV="production" deploy_app # Uses inline env override
Everyday Analogy: Using default thermostat settings unless a custom override button is actively pressed.

Line Breakdown:

${DEPLOY_ENV:-staging}: Parameter expansion providing default value if DEPLOY_ENV is unset or empty.

Answer 14.15: Combining Strict Mode Header
Bash
#!/bin/bash
set -euo pipefail
# -e : Exit immediately if a command exits with a non-zero status
# -u : Treat unset variables as an error when expanding
# -o pipefail : Return status of rightmost non-zero exit command in pipeline

echo "DevOps Strict Script initialized safely."
Everyday Analogy: Fastening safety belt, checking mirrors, and arming airbags before driving a race car.

Line Breakdown:

set -euo pipefail: The gold-standard safety header for production Bash scripts