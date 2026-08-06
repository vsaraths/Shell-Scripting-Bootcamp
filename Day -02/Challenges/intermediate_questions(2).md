# Intermediate Questions

🟡 Intermediate (Challenges 2.11 – 2.25)
Challenge 2.11: Write a script that checks if a variable API_KEY is set and non-empty using if [[ -z "${API_KEY:-}" ]], printing "API_KEY is missing!" if empty.

Challenge 2.12: Demonstrate parameter expansion fallback ${var:-default} vs assignment fallback ${var:=default} when variable ENV_STAGE is empty.

Challenge 2.13: Declare a variable readonly SYSTEM_MODE="READ_ONLY" and attempt to reassign it later in the script to demonstrate Bash's immutability error guard.

Challenge 2.14: Write a script that captures the output of whoami and hostname into variables, and concatenates them into a connection string USER_HOST="${CURRENT_USER}@${CURRENT_HOST}".

Challenge 2.15: Show the difference between export scope and script scope: declare LOCAL_VAR="secret" vs export GLOBAL_VAR="shared", and verify their availability inside a child subshell bash -c '...'.

Challenge 2.16: Write an append loop: start with SUMMARY="" and append 3 log line entries inside a for loop, separating entries with newlines or semicolons.

Challenge 2.17: Demonstrate escape character preservation: show how echo "Path: \$HOME" prevents variable expansion while preserving the dollar sign literal.

Challenge 2.18: Differentiate between unset variable testing -v vs zero-length testing -z: write an if/elif check testing [[ ! -v UNSET_VAR ]] vs [[ -z "$EMPTY_VAR" ]].

Challenge 2.19: Write a variable sanitizer script that strips leading and trailing spaces from an input variable RAW_INPUT="   admin_user   " using xargs or parameter substitution.

Challenge 2.20: Prevent global variable pollution inside a function: declare a variable using local VAR="value" inside a function, and verify that $VAR remains empty outside the function scope.

Challenge 2.21: Use declare -i to enforce integer typing on variable COUNT, demonstrating how attempting to assign a string value like "hello" resets or evaluates it to 0.

Challenge 2.22: Use declare -l (lowercase) and declare -u (uppercase) to create self-normalizing variables that automatically convert assigned strings.

Challenge 2.23: Store a multi-line text block inside a variable using Here-Doc syntax read -r -d '' MSG << 'EOF' ... EOF and print it cleanly.

Challenge 2.24: Write a script demonstrating the dangers of unquoted variable expansion inside [ ] conditionals vs quoted expansion inside [[ ]].

Challenge 2.25: Use printf -v VAR "format" to format and store a padded zero string (e.g., BATCH_005) directly into a variable without invoking subshells.