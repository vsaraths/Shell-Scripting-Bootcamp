🟢 Beginner Answers (4.1 -- 4.10)Answer 4.1Bash#!/bin/bash read -p
"Enter your username:" username echo "Welcome, \${username}!" Answer
4.2Bash#!/bin/bash \# -r prevents backslashes from acting as escape
characters read -r -p "Enter absolute file path:" raw_path echo "Target
path: \${raw_path}" Answer 4.3Bash#!/bin/bash \# -s suppresses terminal
echo for password fields read -s -p "Enter secret passcode:" passcode
echo -e "`\nPasscode `{=tex}received securely." Answer
4.4Bash#!/bin/bash \# -n 1 returns as soon as 1 character is typed read
-n 1 -p "Do you want to continue? (y/n):" choice echo -e
"`\nYou `{=tex}selected: \${choice}" Answer 4.5Bash#!/bin/bash read -p
"Enter target port \[8080\]:" TARGET_PORT \#
${var:-default} falls back without modifying original var
ACTUAL_PORT="${TARGET_PORT:-8080}" echo "Connecting to port:
\${ACTUAL_PORT}" Answer 4.6Bash#!/bin/bash MESSAGE="DevOps Automation"
echo "Length of message: ${#MESSAGE} characters"
Answer 4.7Bash#!/bin/bash
TODAY="2026-08-07"
# Offset 0, length 4
YEAR="${TODAY:0:4}" echo "Year: ${YEAR}"
Answer 4.8Bash#!/bin/bash
input_name="${1:-Alexander}" nickname="\${input_name:0:3}" echo
"Generated Nickname: \${nickname}" Answer 4.9Bash#!/bin/bash \# -t 5
times out after 5 seconds if read -t 5 -p "Enter confirmation within
5s:" response; then echo "Received: \${response}" else echo -e
"`\nTimeout `{=tex}reached! Defaulting to cancel." fi Answer
4.10Bash#!/bin/bash \# -a reads words directly into an array read -a
nodes -p "Enter node names separated by spaces:" echo "First node:
\${nodes\[0\]}, Total nodes: \${#nodes\[@\]}"
