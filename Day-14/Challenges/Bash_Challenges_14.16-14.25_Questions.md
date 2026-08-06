# Bash Scripting Challenges 14.16--14.25

## 📋 QUESTIONS

### Challenge 14.16: Safe Temporary Directory Cleanup Trap

-   **Scenario**: Write a script that creates a unique temporary working
    folder `/tmp/deploy_XXXXXX` using `mktemp -d`. Register an `EXIT`
    trap that removes this folder safely regardless of whether the
    script completes successfully or crashes.

### Challenge 14.17: Atomic Lockfile Guard (`PID` Lock)

-   **Scenario**: Create a function `acquire_lock` that writes the
    current script's PID (`$$`) into `/tmp/app.lock`. If the lockfile
    already exists, print an error and exit with status `1`. Ensure the
    lockfile is automatically removed on exit using a trap.

### Challenge 14.18: Function Return Value vs. Standard Output

-   **Scenario**: Build a function `get_cpu_usage` that calculates mock
    CPU load (e.g., outputs `25%` via `echo`) and returns an exit code
    of `0` if usage is under `80%`, or `1` if usage exceeds `80%`. Show
    how to capture the stdout string while simultaneously evaluating the
    exit code `$?`.

### Challenge 14.19: Selective Error Bypass in Strict Mode (`set -e`)

-   **Scenario**: In a script with `set -e` enabled, execute a command
    that might fail (e.g., `grep "needle" haystack.txt`) without causing
    the script to exit when the pattern isn't found.

### Challenge 14.20: Recursive Function with Local Scope Stack

-   **Scenario**: Write a recursive function `factorial` that calculates
    the factorial of a number passed as `$1`. Ensure all loop and state
    variables use `local` scope so recursive calls do not pollute caller
    variables.

### Challenge 14.21: Dynamic Variable Fallbacks with Expansion Operators

-   **Scenario**: Write a function `connect_db` that accepts host, port,
    and user parameters. Use parameter expansion default operators
    (`${1:-localhost}`, `${2:-5432}`, `${3:-postgres}`) inside the
    function to fall back to defaults when arguments are missing.

### Challenge 14.22: Custom Logging Wrapper Function with Severity Levels

-   **Scenario**: Write a function `log_msg` that takes a log level
    (`INFO`, `WARN`, `ERROR`) as `$1` and a message as `$2`. Prepend
    each output line with an ISO 8601 timestamp and send `ERROR`
    messages to `stderr` (`>&2`) while sending `INFO`/`WARN` to
    `stdout`.

### Challenge 14.23: Multi-Signal Cleanup Handler (`SIGINT`, `SIGTERM`, `EXIT`)

-   **Scenario**: Write a trap configuration that routes `SIGINT`
    (Ctrl+C), `SIGTERM`, and `EXIT` through a unified `cleanup` handler
    function. Ensure the handler executes cleanup logic exactly once.

### Challenge 14.24: Safe Pipeline Handling under `set -o pipefail`

-   **Scenario**: Demonstrate how to safely process output through
    `head` or `grep` in a pipeline when `set -o pipefail` is enabled,
    without triggering a `SIGPIPE` failure.

### Challenge 14.25: Function Array Output via Indirect Reference

-   **Scenario**: Write a function `get_failed_services` that populates
    an array with failed service names (`nginx`, `db`) and returns the
    results to the caller script using string/array parsing or variable
    assignment.
