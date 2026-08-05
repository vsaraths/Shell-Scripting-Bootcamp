### 💡 Script Code (`log_analyzer.sh`)

Here is the exact code to put inside **`log_analyzer.sh`**:

```bash
#!/bin/bash

# Target log file from argument or default to local access.log
log_file=${1:-"access.log"}

# Generate dummy log data if the target file does not exist
if [ ! -f "$log_file" ]; then
    echo "Creating sample $log_file for demonstration..."
    cat << 'EOF' > "$log_file"
192.168.1.10 - - [05/Aug/2026:10:00:01 +0000] "GET /index.html HTTP/1.1" 200 1024
10.0.0.5 - - [05/Aug/2026:10:00:02 +0000] "POST /api/login HTTP/1.1" 500 512
192.168.1.15 - - [05/Aug/2026:10:00:03 +0000] "GET /about.html HTTP/1.1" 200 2048
172.16.0.4 - - [05/Aug/2026:10:00:04 +0000] "GET /missing.php HTTP/1.1" 404 128
10.0.0.5 - - [05/Aug/2026:10:00:05 +0000] "POST /api/checkout HTTP/1.1" 500 256
192.168.1.10 - - [05/Aug/2026:10:00:06 +0000] "GET /dashboard HTTP/1.1" 200 4096
EOF
fi

echo "=========================================="
echo "📊 LOG ANALYSIS REPORT: $log_file"
echo "=========================================="

total_requests=$(wc -l < "$log_file")
success_requests=$(grep -c " 200 " "$log_file" || true)
client_errors=$(grep -c " 404 " "$log_file" || true)
server_errors=$(grep -c " 500 " "$log_file" || true)

echo "▶️ Total Requests Processed : $total_requests"
echo "🟢 Successful Hits (200)   : $success_requests"
echo "⚠️ Not Found Errors (404)  : $client_errors"
echo "🚨 Internal Errors (500)   : $server_errors"
