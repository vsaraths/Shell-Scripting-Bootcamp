# Beginner Answers

🟢 Beginner Answers (3.1 – 3.10)
Answer 3.1
Bash
#!/bin/bash
set -euo pipefail

name="${1:-Sarath}"
echo "Hello, ${name}! Welcome aboard."
Answer 3.2
Bash
#!/bin/bash
set -euo pipefail

first="${1:-Varivettuchalil}"
last="${2:-Sarath}"

echo "Full Name: ${first} ${last}"
Answer 3.3
Bash
#!/bin/bash
set -euo pipefail

echo "Total guests : $#"
echo "Guest list   : $@"
Answer 3.4
Bash
#!/bin/bash
set -euo pipefail

level=1
(( level++ ))

echo "Leveled up! Current level: ${level}"
Answer 3.5
Bash
#!/bin/bash
set -euo pipefail

num="${1:-5}"
(( result = num * 2 ))

echo "Double of ${num} is ${result}"
Answer 3.6
Bash
#!/bin/bash
set -euo pipefail

loot="${1:-100}"
(( share = loot / 4 ))

echo "Total Loot: ${loot} | Share per player: ${share}"
Answer 3.7
Bash
#!/bin/bash
set -euo pipefail

(( roll = RANDOM % 5 ))
echo "Magic Dice Roll (0-4): ${roll}"
Answer 3.8
Bash
#!/bin/bash
set -euo pipefail

target="${1:-/etc/passwd}"

if [[ -f "${target}" ]]; then
  echo "File Detective: '${target}' exists and is a regular file."
else
  echo "File Detective: '${target}' NOT found or is not a regular file."
fi
Answer 3.9
Bash
#!/bin/bash
set -euo pipefail

num="${1:-7}"
(( remainder = num % 2 ))

if (( remainder == 0 )); then
  echo "Number ${num} is EVEN."
else
  echo "Number ${num} is ODD."
fi
Answer 3.10
Bash
#!/bin/bash
set -euo pipefail

num="${1:-4}"
(( square = num ** 2 ))

echo "Square of ${num} is ${square}"