# Beginner Answers

🟢 Beginner Answers (2.1 – 2.10)
Answer 2.1
Bash
#!/bin/bash
set -euo pipefail

# Variable Assignment & Reassignment
ITEM="Laptop"
echo "Initial Backpack Item : ${ITEM}"

ITEM="Camera"
echo "Updated Backpack Item : ${ITEM}"
Answer 2.2
Bash
#!/bin/bash
set -euo pipefail

FIRST_NAME="Varivettuchalil"
LAST_NAME="Sarath"

# String Concatenation
FULL_NAME="${FIRST_NAME} ${LAST_NAME}"
echo "Badge Name: ${FULL_NAME}"
Answer 2.3
Bash
#!/bin/bash
set -euo pipefail

# Self-referential String Appending
ORDER="Coffee"
ORDER="${ORDER} and Croissant"

echo "Current Order: ${ORDER}"
Answer 2.4
Bash
#!/bin/bash
set -euo pipefail

# CORRECT: No spaces around '='
VALID_VAR="Successful Assignment"
echo "Valid: ${VALID_VAR}"

# INCORRECT (Demonstration): Spaces around '=' cause Bash to treat VAR as a command!
# VAR = "value" # <-- Throws: "VAR: command not found"
Answer 2.5
Bash
#!/bin/bash
set -euo pipefail

USER_NAME="Sarath"

# Double Quotes: Expands variables
echo "Double Quotes : Hello ${USER_NAME}"

# Single Quotes: Preserves literal text
echo 'Single Quotes : Hello ${USER_NAME}'
Answer 2.6
Bash
#!/bin/bash
set -euo pipefail

GHOST=""
# ${UNSET_VAR:-} prevents set -u unbound variable crashes
echo "Empty Variable Value : [${GHOST}]"
echo "Unset Variable Value : [${UNSET_VAR:-}]"
Answer 2.7
Bash
#!/bin/bash
set -euo pipefail

PORT=8080
echo "Initial Port : ${PORT}"

PORT=8081
echo "Updated Port : ${PORT}"
Answer 2.8
Bash
#!/bin/bash
set -euo pipefail

# Command Substitution $()
TODAY=$(date +%Y-%m-%d)
echo "Today's Date: ${TODAY}"
Answer 2.9
Bash
#!/bin/bash
set -euo pipefail

VAR="dev"
# Using ${VAR} prevents ambiguity with $VARsuffix
echo "Environment: ${VAR}_cluster"
Answer 2.10
Bash
#!/bin/bash
set -euo pipefail

LOG_MSG="System boot sequence initiated"

# Double quoting preserves the entire string as 1 word
echo "Log Message: \"${LOG_MSG}\""