# Advanced Questions

🔴 Advanced (Challenges 2.26 – 2.35)
Challenge 2.26: Implement dynamic variable expansion (variable indirection) using eval or namerefs ${!var_name}: given TARGET_VAR="SERVER_IP" and SERVER_IP="192.168.1.100", resolve the value of SERVER_IP indirectly.

Challenge 2.27: Build a secure variable mask utility: take a secret key variable SECRET="sk_live_1234567890abcdef" and create a masked variable MASKED_SECRET showing only the first 3 and last 3 characters (sk_******************def).

Challenge 2.28: Enforce strict execution under set -u (set -o nounset): demonstrate how referencing an uninitialized variable triggers an immediate script exit, and implement safe parameter expansion defaults ${UNSET_VAR:-} to avoid crashes.

Challenge 2.29: Write an environment configuration parser: read .env file key-value pairs line by line using read -r line, strip surrounding double/single quotes from values, and export them safely.

Challenge 2.30: Construct an immutable system configuration object using declare -r on an array or individual constants to lock infrastructure settings against accidental mutation.

Challenge 2.31: Build a zero-subshell variable path parser: parse an absolute binary path /usr/local/bin/python3 into DIR_PATH="/usr/local/bin" and BINARY_NAME="python3" using pure parameter expansion.

Challenge 2.32: Measure the memory overhead of environment variables: export a large variable (10,000 characters) and inspect ENV size or process memory under /proc/$$/environ.

Challenge 2.33: Demonstrate subshell variable isolation in pipeline execution: show why cat file.txt | while read line; do COUNT++; done fails to update COUNT in the parent shell, and fix it using process substitution < <(...).

Challenge 2.34: Build a dynamic template rendering engine: replace placeholder variables ${USER} and ${DATE} inside a template string variable TEMPLATE="Hello ${USER}, report generated on ${DATE}" dynamically at runtime.

Challenge 2.35: Synthesis Capstone — Variable Management & Safety Master: write a production-ready script enforcing set -euo pipefail, validating mandatory variables, applying fallback defaults, locking constants with readonly, isolating local scope in functions, and generating a formatted diagnostic card.