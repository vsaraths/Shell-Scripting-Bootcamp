# Bash Scripting Answers & Explanations 14.16--14.25

## 💡 ANSWERS & EXPLANATIONS

### Answer 14.16: Safe Temporary Directory Cleanup Trap

``` bash
#!/bin/bash
set -euo pipefail

WORK_DIR=$(mktemp -d /tmp/deploy_XXXXXX)

cleanup() {
  echo "[CLEANUP] Removing temporary workspace: ${WORK_DIR}"
  rm -rf "${WORK_DIR}"
}

trap cleanup EXIT

echo "Working inside ${WORK_DIR}..."
touch "${WORK_DIR}/build.log"
```

**Explanation** - `mktemp -d` creates a unique temporary directory. -
`trap cleanup EXIT` guarantees cleanup on normal exit or errors.

------------------------------------------------------------------------

### Answer 14.17: Atomic Lockfile Guard (`PID` Lock)

``` bash
#!/bin/bash
set -euo pipefail

LOCKFILE="/tmp/app.lock"

cleanup() {
  rm -f "${LOCKFILE}"
}

acquire_lock() {
  if ! (set -o noclobber; echo "$$" > "${LOCKFILE}") 2>/dev/null; then
    echo "ERROR: Script is already running under PID $(cat "${LOCKFILE}")" >&2
    exit 1
  fi
  trap cleanup EXIT
}

acquire_lock
echo "Lock acquired successfully under PID $$"
```

**Explanation** - `noclobber` makes lock creation atomic. - PID is
stored for diagnostics.

------------------------------------------------------------------------

### Answer 14.18: Function Return Value vs. Standard Output

``` bash
#!/bin/bash
set -euo pipefail

get_cpu_usage() {
  local load=85
  echo "${load}%"
  (( load <= 80 ))
}

if cpu_out=$(get_cpu_usage); then
  echo "CPU Load Normal: ${cpu_out}"
else
  echo "WARNING: CPU Load High (${cpu_out})! Exit code: $?"
fi
```

------------------------------------------------------------------------

### Answer 14.19: Selective Error Bypass in Strict Mode

``` bash
#!/bin/bash
set -euo pipefail

grep "missing_key" /etc/passwd || true

if grep -q "missing_key" /etc/passwd; then
  echo "Found"
fi
```

------------------------------------------------------------------------

### Answer 14.20: Recursive Function with Local Scope Stack

``` bash
#!/bin/bash
set -euo pipefail

factorial() {
  local n="$1"

  if (( n <= 1 )); then
    echo 1
    return
  fi

  local prev
  prev=$(factorial $((n-1)))
  echo $((n * prev))
}

echo "Factorial: $(factorial 5)"
```

------------------------------------------------------------------------

### Answer 14.21: Dynamic Variable Fallbacks

``` bash
#!/bin/bash
set -euo pipefail

connect_db() {
  local host="${1:-localhost}"
  local port="${2:-5432}"
  local user="${3:-postgres}"

  echo "Connecting to ${host}:${port} as ${user}"
}

connect_db db.internal
```

------------------------------------------------------------------------

### Answer 14.22: Logging Wrapper

``` bash
#!/bin/bash
set -euo pipefail

log_msg() {
  local level="$1"
  local msg="$2"
  local ts
  ts=$(date +"%Y-%m-%dT%H:%M:%S")

  if [[ "$level" == "ERROR" ]]; then
    echo "[$ts] [$level] $msg" >&2
  else
    echo "[$ts] [$level] $msg"
  fi
}
```

------------------------------------------------------------------------

### Answer 14.23: Multi-Signal Cleanup

``` bash
#!/bin/bash
set -euo pipefail

cleaned=0

cleanup() {
  (( cleaned )) && return
  cleaned=1
  echo "Cleaning resources..."
}

trap cleanup SIGINT SIGTERM EXIT
```

------------------------------------------------------------------------

### Answer 14.24: Safe Pipeline with pipefail

``` bash
#!/bin/bash
set -euo pipefail

first_user=$(cat /etc/passwd | { head -n 1 || true; })

echo "$first_user"
```

------------------------------------------------------------------------

### Answer 14.25: Returning Arrays

``` bash
#!/bin/bash
set -euo pipefail

get_failed_services() {
  local -n out="$1"
  out=("nginx" "db")
}

services=()
get_failed_services services

echo "${services[*]}"
```
