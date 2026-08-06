---

### 💡 Script Code (`log_analyzer_cli.sh`)

Here is the exact code to put inside **`log_analyzer_cli.sh`**:

```bash
#!/bin/bash
set -euo pipefail

usage() {
    echo "=========================================="
    echo "📊 LOG ANALYZER CLI TOOL"
    echo "=========================================="
    echo "Usage: $0 -f <log_file> [-e]"
    echo "  -f : Path to web server log file (required)"
    echo "  -e : Show HTTP error lines only (404, 500, etc.)"
    echo "  -h : Display help and exit"
    echo "=========================================="
    exit 1
}

log_file=""
errors_only=false

while getopts "f:eh" opt; do
    case $opt in
        f) log_file="$OPTARG" ;;
        e) errors_only=true ;;
        h | *) usage ;;
    esac
done

# If no file was provided or file does not exist, generate a sample log file automatically
if [ -z "$log_file" ] || [ ! -f "$log_file" ]; then
    log_file="sample.log"
    echo "⚠️ Target log file missing. Generating temporary test log: $log_file"
    cat << 'EOF' > "$log_file"
192.168.1.10 - - [05/Aug/2026:10:00:01 +0000] "GET /index.html HTTP/1.1" 200 1024
10.0.0.5 - - [05/Aug/2026:10:00:02 +0000] "POST /api/login HTTP/1.1" 500 512
192.168.1.15 - - [05/Aug/2026:10:00:03 +0000] "GET /about.html HTTP/1.1" 200 2048
172.16.0.4 - - [05/Aug/2026:10:00:04 +0000] "GET /missing.php HTTP/1.1" 404 128
10.0.0.5 - - [05/Aug/2026:10:00:05 +0000] "POST /api/checkout HTTP/1.1" 500 256
192.168.1.10 - - [05/Aug/2026:10:00:06 +0000] "GET /dashboard HTTP/1.1" 200 4096
192.168.1.10 - - [05/Aug/2026:10:00:07 +0000] "GET /profile HTTP/1.1" 200 1024
EOF
fi

echo "=========================================="
echo "📊 DEVOPS LOG ANALYZER REPORT"
echo "Target File: $log_file"
echo "=========================================="

if [ "$errors_only" = true ]; then
    echo "🚨 FILTERED RESULT: HTTP Error Logs (4xx / 5xx)"
    echo "------------------------------------------"
    grep -E " 4[0-9]{2} | 5[0-9]{2} " "$log_file" || echo "No HTTP errors found."
else
    echo "▶️ Total Log Entries : $(wc -l < "$log_file")"
    echo -e "\n🔝 Top Client IP Addresses by Request Count:"
    echo "------------------------------------------"
    awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -n 5
fi

echo "=========================================="
