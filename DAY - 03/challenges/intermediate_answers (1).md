# Intermediate Answers

🟡 Intermediate Answers (3.11 – 3.25)
Answer 3.11
Bash
#!/bin/bash
set -euo pipefail

if (( $# != 2 )); then
  echo "Error: Expected exactly 2 arguments, received $#." >&2
  echo "Usage: $0 <arg1> <arg2>" >&2
  exit 1
fi

echo "Arg 1: $1 | Arg 2: $2"
Answer 3.12
Bash
#!/bin/bash
set -euo pipefail

# Fallback default using parameter expansion ${1:-default}
user_name="${1:-Guest}"
echo "Welcome, ${user_name}!"
Answer 3.13
Bash
#!/bin/bash
set -euo pipefail

echo "--- Quoted \$* (combines all arguments into 1 string) ---"
for arg in "$*"; do
  echo "Arg: ${arg}"
done

echo "--- Quoted \$@ (preserves individual arguments) ---"
for arg in "$@"; do
  echo "Arg: ${arg}"
done
Answer 3.14
Bash
#!/bin/bash
set -euo pipefail

file="${1:-/etc/passwd}"
lines="${2:-3}"

if [[ -f "${file}" ]]; then
  echo "Showing top ${lines} lines of ${file}:"
  head -n "${lines}" "${file}"
else
  echo "Error: File '${file}' not found!" >&2
  exit 1
fi
Answer 3.15
Bash
#!/bin/bash
set -euo pipefail

num1="${1:-10}"
op="${2:-+}"
num2="${3:-5}"

case "${op}" in
  +) (( res = num1 + num2 )) ;;
  -) (( res = num1 - num2 )) ;;
  \*) (( res = num1 * num2 )) ;;
  /) (( res = num1 / num2 )) ;;
  *) echo "Invalid operator: ${op}" >&2; exit 1 ;;
esac

echo "Result: ${num1} ${op} ${num2} = ${res}"
Answer 3.16
Bash
#!/bin/bash
set -euo pipefail

min="${1:-10}"
max="${2:-50}"

(( rand = min + RANDOM % (max - min + 1) ))
echo "Random number between ${min} and ${max}: ${rand}"
Answer 3.17
Bash
#!/bin/bash
set -euo pipefail

echo "Original \$1: ${1:-None}"
shift || true
echo "After shift, new \$1: ${1:-None}"
Answer 3.18
Bash
#!/bin/bash
set -euo pipefail

num1="${1:-5}"
num2="${2:-2}"

# Floating-point division using awk
res=$(awk -v a="${num1}" -v b="${num2}" 'BEGIN {printf "%.2f", a / b}')
echo "Floating Point Result: ${num1} / ${num2} = ${res}"
Answer 3.19
Bash
#!/bin/bash
set -euo pipefail

if (( $# == 0 )); then
  set -- "/etc/passwd" "/etc/hosts"
fi

total_bytes=0
for f in "$@"; do
  if [[ -f "$f" ]]; then
    bytes=$(wc -c < "$f")
    (( total_bytes += bytes ))
    echo "File: $f (${bytes} bytes)"
  fi
done

echo "Aggregated Total Size: ${total_bytes} bytes"
Answer 3.20
Bash
#!/bin/bash
set -euo pipefail

script_name="${0##*/}"

show_usage() {
  echo "Usage: ${script_name} <username> <role>"
  exit 1
}

if (( $# < 2 )); then
  show_usage
fi
Answer 3.21
Bash
#!/bin/bash
set -euo pipefail

a="${1:-15}"
b="${2:-30}"

echo "Before Swap : a=${a}, b=${b}"

(( a = a + b ))
(( b = a - b ))
(( a = a - b ))

echo "After Swap  : a=${a}, b=${b}"
Answer 3.22
Bash
#!/bin/bash
set -euo pipefail

num="${1:-15}"

if (( num % 3 == 0 && num % 5 == 0 )); then
  echo "Number ${num} is a multiple of BOTH 3 and 5 (FizzBuzz!)."
else
  echo "Number ${num} is NOT a joint multiple of 3 and 5."
fi
Answer 3.23
Bash
#!/bin/bash
set -euo pipefail

principal="${1:-100}"
rate="${2:-2}"
steps="${3:-3}"

current="${principal}"
for (( i=1; i<=steps; i++ )); do
  (( current = current * rate ))
  echo "Step ${i}: ${current}"
done

echo "Final Compound Growth: ${current}"
Answer 3.24
Bash
#!/bin/bash
set -euo pipefail

input="${1:-42}"

if [[ "${input}" =~ ^-?[0-9]+$ ]]; then
  (( double = input * 2 ))
  echo "Valid Integer: ${input} x 2 = ${double}"
else
  echo "Error: Input '${input}' is NOT a valid integer!" >&2
  exit 1
fi
Answer 3.25
Bash
#!/bin/bash
set -euo pipefail

if (( $# == 0 )); then
  set -- "alpha" "beta" "gamma" "delta"
fi

# ${!#} resolves dynamically to the last positional parameter
last_arg="${!#}"
echo "Total Arguments : $#"
echo "Last Argument   : ${last_arg}"