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
