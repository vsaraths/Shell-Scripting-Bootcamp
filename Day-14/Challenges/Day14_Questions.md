# Day 14 - Questions

📋 QUESTIONS (Beginner Challenges 14.1 – 14.15)
Challenge 14.1: Basic Function Declaration & Call
Scenario: Create a function greet_user that takes a name as a parameter and prints "Hello, <name>! Welcome to DevOps training.".

Sample Input: Call function with argument "Alex".

Challenge 14.2: Function Return Codes (Exit Status)
Scenario: Write a function check_file_exists that takes a file path as $1. Return 0 (success) if the file exists, or 1 (failure) if it does not.

Sample Input: Path /tmp/test.txt.

Challenge 14.3: Enforcing Local Scope (local)
Scenario: Write a script where a global variable status="GLOBAL" exists. Inside a function update_status, create a variable named status set to "LOCAL" using the local keyword. Demonstrate that the global variable remains untouched outside the function.

Challenge 14.4: Function Argument Handling ($1, $2, $@)
Scenario: Create a function list_servers that accepts a variable number of server hostnames and prints each server name preceded by "Server target: ".

Challenge 14.5: Capturing Function Output via Command Substitution
Scenario: Write a function calculate_disk_gb that converts Megabytes (MB) to Gigabytes (GB) using integer division (MB / 1024). Store the result returned by the function into a script variable using $().

Challenge 14.6: Strict Mode - Unset Variables (set -u)
Scenario: Demonstrate set -u behavior by attempting to print an uninitialized variable $UNSET_VAR. Show how Bash terminates execution with an error message.

Challenge 14.7: Strict Mode - Error Exit (set -e)
Scenario: Demonstrate set -e by executing a command that fails (e.g., ls /non_existent_folder) followed by an echo "This should not run". Verify the second command is never reached.

Challenge 14.8: Strict Mode - Pipeline Failures (set -o pipefail)
Scenario: Run a pipeline cat non_existent_file.txt | grep "something". Demonstrate that with set -o pipefail, the script detects the pipeline error even though grep receives input stream EOF.

Challenge 14.9: Basic Exit Signal Trap (trap ... EXIT)
Scenario: Write a script that creates a temporary directory /tmp/demo_app_XXXXXX. Use trap on the EXIT signal to ensure the directory is automatically removed when the script finishes.

Challenge 14.10: Catching Ctrl+C Interrupts (SIGINT)
Scenario: Write a long-running loop (sleep 1 inside a loop). Use trap to catch SIGINT (Ctrl+C) and display "Gracefully shutting down..." before exiting with code 130.

Challenge 14.11: Handling Function Failure with || return
Scenario: Inside a function backup_database, attempt to access a missing backup source. Use cd /invalid_path || return 1 to exit the function early with an error code without stopping the main script (if set -e is handled).

Challenge 14.12: Passing Arrays to Functions
Scenario: Write a function process_ports that receives an array of port numbers (80, 443, 8080) and prints each port.

Challenge 14.13: Catching Script Errors (trap ... ERR)
Scenario: Configure trap to fire an error handler function on_error whenever any line in the script returns a non-zero exit code (ERR signal).

Challenge 14.14: Environment Variables vs. Function Parameters
Scenario: Write a function deploy_app that falls back to a default environment ENV="staging" if the environment variable DEPLOY_ENV is not set.

Challenge 14.15: Combining Strict Mode Header
Scenario: Create a boilerplate production script header containing set -euo pipefail along with a comment explaining what each flag does.