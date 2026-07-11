# 🏁 Day 4: Variable Challenge Arena - Volume 3 Solution Manual

This document provides the official answers, script architectures, and
terminal output examples for **challenges 36 through 55**.

------------------------------------------------------------------------

## 🟢 Level 11: Dynamic Command Capture

### Challenge 36: The Time Traveler

``` bash
#!/bin/bash
current_time=$(date)
echo "The current chronological system marker is: $current_time"
```

**Expected Output**

``` text
The current chronological system marker is: Sat Jul 11 13:44:43 IST 2026
```

### Challenge 37: The Folder Auditor

``` bash
#!/bin/bash
file_count=$(ls | wc -l)
echo "System Scan Complete: There are currently $file_count items in this directory."
```

### Challenge 38: The Kernel Investigator

``` bash
#!/bin/bash
kernel_version=$(uname -r)
echo "=========================================="
echo "🚀 SYSTEM CORE DIAGNOSTIC ENGINE"
echo "Running Kernel Version: $kernel_version"
echo "=========================================="
```

------------------------------------------------------------------------

## 🟡 Level 12: Complex Decisions & Nested Logic

### Challenge 39: The Traffic Light Simulator

``` bash
#!/bin/bash
color="$1"

if [ "$color" == "Red" ]; then
    echo "Stop! 🛑"
elif [ "$color" == "Yellow" ]; then
    echo "Slow Down! ⚠️"
elif [ "$color" == "Green" ]; then
    echo "Go! 🟢"
else
    echo "Invalid traffic signal color."
fi
```

### Challenge 40: The Number Range Guard

``` bash
#!/bin/bash
num=$1

if (( num > 10 && num < 50 )); then
    echo "✅ Success: $num is safely inside the target boundary (11-49)."
else
    echo "❌ Alert: $num sits outside permitted operational bounds."
fi
```

### Challenge 41: The Empty String Emergency

``` bash
#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "⚠️ PARAMETER EMERGENCY: Missing critical inputs!"
    echo "Usage: $0 [Parameter 1] [Parameter 2]"
    exit 1
fi

echo "All variables loaded successfully: Input 1='$1', Input 2='$2'"
```

------------------------------------------------------------------------

## 🟠 Level 13: File Reading & Text Splitting

### Challenge 42: The Configuration Loader

``` bash
#!/bin/bash
echo "production-server" > host.txt
read -r active_host < host.txt
echo "Target configuration environment loaded: $active_host"
```

### Challenge 43: The Secret Phrase Extracted

``` bash
#!/bin/bash
sentence="Automate everything everywhere every day"
total_matches=$(echo "$sentence" | grep -o "every" | wc -l)
echo "The pattern prefix 'every' was isolated exactly $total_matches times."
```

### Challenge 44: Upper and Lower Case Transformers

``` bash
#!/bin/bash
tool="ansible"
CLOUD="AWS"

echo "Shouting string: ${tool^^}"
echo "Whispering string: ${CLOUD,,}"
```

**Expected Output**

``` text
Shouting string: ANSIBLE
Whispering string: aws
```

------------------------------------------------------------------------

## 🔴 Level 14: Dynamic Execution Arrays & Lists

### Challenge 45

``` bash
#!/bin/bash
servers=("srv-01" "srv-02" "srv-03")
echo "Targeting index location [1]: ${servers[1]}"
```

**Expected Output**

``` text
Targeting index location [1]: srv-02
```

### Challenge 46

``` bash
#!/bin/bash
tools=("Git" "Docker" "Kubernetes")

echo "--- Core DevOps Automation Stack ---"
for tool in "${tools[@]}"; do
    echo " * Tool Deployment Track: $tool"
done
```

### Challenge 47

``` bash
#!/bin/bash
checklist=("Verify DNS" "Check Disk Space" "Restart Nginx" "Clear Cache")
total_elements=${#checklist[@]}

echo "Operational Audit Matrix: $total_elements critical verification checks pending."
```

------------------------------------------------------------------------

## ⚡ Level 15: Structural DevOps Scenario Simulations

### Challenge 48

``` bash
#!/bin/bash
timestamp=$(date +%Y-%m-%d)
log_file="app_execution_${timestamp}.log"

touch "$log_file"
echo "Log repository generated: $log_file"
```

### Challenge 49

``` bash
#!/bin/bash
ping -c 1 8.8.8.8 > /dev/null 2>&1
status=$?

echo "=========================================="
if (( status == 0 )); then
    echo "🟢 NODE STATUS: REACHABLE"
else
    echo "🔴 NODE STATUS: UNREACHABLE / DOWN"
fi
echo "=========================================="
```

### Challenge 50

``` bash
#!/bin/bash
current_shell_pid=$$
process_footprint=$(ps -p$current_shell_pid -o comm=)

echo "--- Run-Time Diagnostic Footprint ---"
echo "Active Shell Process Identity: $process_footprint"
echo "Process Registration ID: $current_shell_pid"
```

### Challenge 51

``` bash
#!/bin/bash
cpu_load=45

echo "Metrics Pipeline: Current CPU Utilization is at $cpu_load%"

if (( cpu_load > 80 )); then
    echo "🚨 ALERT: High workload threshold violated!"
else
    echo "✅ Performance telemetry signatures look clean."
fi
```

### Challenge 52

``` bash
#!/bin/bash
ENVIRONMENT="development"

while getopts "p" opt; do
  case $opt in
    p) ENVIRONMENT="production" ;;
    *)
      echo "Invalid configuration flag option selection."
      exit 1
      ;;
  esac
done

echo "Configuration Environment Value determined as: $ENVIRONMENT"
```

### Challenge 53

``` bash
#!/bin/bash
target_port=5432

if (( target_port == 5432 )); then
    echo "Standard structural path match: Valid PostgreSQL architecture alignment."
else
    echo "⚠️ Warning: Custom system alternative networking interface detected on port $target_port."
fi
```

### Challenge 54

``` bash
#!/bin/bash
SAFE_MODE="ON"

if [ "$SAFE_MODE" == "ON" ]; then
    echo "🔒 Active Guard: Workspace protection lock is set to ON. No files will be purged."
else
    echo "🗑️ Active Purge: Sandbox environment cleaning initialization executed safely."
fi
```

### Challenge 55

``` bash
#!/bin/bash
read -p "Enter Target Deployment App Name: " app_name
(( random_id = RANDOM % 900 + 100 ))
timestamp=$(date +%Y%m%d_%H%M%S)

microservices=("auth-api" "payment-worker" "frontend-ui")
deployment_target="${app_name}_cluster_#${random_id}"

echo -e "\n========================================================"
echo "🚀 ENTERPRISE RUN-TIME PIPELINE ENGAGED"
echo "========================================================"
echo "👤 Triggered By Account User : $USER"
echo "💻 Node Architecture Identity: $HOSTNAME"
echo "📅 Deployment Operational Key: $timestamp"
echo "🎯 Core Destination Target   : $deployment_target"
echo "--------------------------------------------------------"

echo "Initializing System Checklist Array Topology Matrix:"
for service in "${microservices[@]}"; do
    echo "  ▶️ Loading cluster config parameter string context for: $service"
done

echo -e "--------------------------------------------------------"
echo "✅ PIPELINE SUCCESSFUL: Deployment stage verification reached at Line: $LINENO"
echo "========================================================"
```
