### 💡 Script Code (`robust_script.sh`)

Here is the exact code to put inside **`robust_script.sh`**:

```bash
#!/bin/bash
# Enable strict safety mode:
# -e : Exit immediately if a command exits with a non-zero status
# -u : Treat unset variables as an error when expanding
# -o pipefail : Return status of the last command in a pipeline that failed
set -euo pipefail

# Define temporary file path using current Process ID ($$)
TEMP_FILE="/tmp/temp_data_$$.txt"

# Cleanup function triggered automatically on script exit or interruption
cleanup() {
    local exit_code=$?
    echo -e "\n🧹 CLEANUP: Removing temporary file ($TEMP_FILE)..."
    rm -f "$TEMP_FILE"
    echo "✅ Operation finished with status code: $exit_code"
}

# Trap EXIT signal to guarantee cleanup runs regardless of success or failure
trap cleanup EXIT

# Modular logging function with local scope
log_message() {
    local level="$1"
    local message="$2"
    echo "[$level] $(date '+%Y-%m-%d %H:%M:%S') - $message"
}

# Main script logic
log_message "INFO" "Initializing safe script execution..."

log_message "INFO" "Creating runtime temporary buffer at $TEMP_FILE"
echo "Temporary process payload data" > "$TEMP_FILE"

log_message "INFO" "Processing buffer contents..."
cat "$TEMP_FILE"

log_message "SUCCESS" "All tasks completed successfully."
