🟡 Intermediate Answers (4.11 -- 4.25)Answer 4.11Bash#!/bin/bash \#
\${var:-default} returns fallback but leaves var empty echo "Fallback
check: ${UNSET_VAR:-"default_val"}"
echo "UNSET_VAR is still: '${UNSET_VAR}'"

# \${var:=default} permanently assigns fallback to var

echo "Assignment check: ${UNSET_VAR:="default_val"}"
echo "UNSET_VAR is now permanently: '${UNSET_VAR}'" Answer
4.12Bash#!/bin/bash set -euo pipefail \#
${var:?error} exits script if variable is null or unset
API_KEY="${1:?Error: API_KEY argument 1 is required!}" echo "API Key
loaded: ${API_KEY}"
Answer 4.13Bash#!/bin/bash
full_path="/var/log/nginx/access.log"
# ##*/ strips longest pattern ending with / (leaves filename)
filename="${full_path##*/}" echo "Extracted Filename: ${filename}"
Answer 4.14Bash#!/bin/bash
filename="deployment_v2.tar.gz"
# %%.* strips longest trailing pattern starting with .
basename="${filename%%.*}" echo "Extracted Base Name: ${basename}"
Answer 4.15Bash#!/bin/bash
url="http://example.com/api/http://mirror"
# Single slash replaces first match only
fixed_url="${url/http:///https://}" echo "Fixed URL: ${fixed_url}"
Answer 4.16Bash#!/bin/bash
config="host1=localhost; host2=localhost; host3=localhost"
# Double slash replaces ALL matches
fixed_config="${config//localhost/127.0.0.1}" echo "Updated Config:
\${fixed_config}" Answer 4.17Bash#!/bin/bash APP_ENV="production" \#
\^\^ converts all characters to uppercase echo "Uppercase:
\${APP_ENV\^\^}" Answer 4.18Bash#!/bin/bash HEADER="AUTHORIZATION" \# ,,
converts all characters to lowercase echo "Lowercase: \${HEADER,,}"
Answer 4.19Bash#!/bin/bash role="admin" \# \^ converts first character
to uppercase echo "Capitalized Role: ${role^}"
Answer 4.20Bash#!/bin/bash
version="release-v2.5.0"
# Space before minus sign is required for negative offset
ext="${version: -5}" echo "Tail substring: \${ext}" Answer
4.21Bash#!/bin/bash \# -s hides output, -n 4 stops automatically after 4
keys read -s -n 4 -p "Enter 4-digit PIN:" pin echo -e
"`\nPIN `{=tex}recorded." Answer 4.22Bash#!/bin/bash \# -d',' uses comma
as record delimiter instead of newline echo"Enter CSV row (end with
comma):" read -d "," field1 echo "Captured field: ${field1}"
Answer 4.23Bash#!/bin/bash
path="/tmp/scratch/file.txt"
# # anchor replaces pattern only if at start of string
new_path="${path/#/tmp/var/tmp}" echo "Replaced Start Path: ${new_path}"
Answer 4.24Bash#!/bin/bash
file="script.sh.bak"
# % anchor replaces pattern only if at end of string
clean_file="${file/%.bak/}" echo "Stripped File: \${clean_file}" Answer
4.25Bash#!/bin/bash read -s -p "Set new password:" pass echo "" if ((
${#pass} < 8 )); then
  echo "Error: Password too short (${#pass} chars)! Must be at least 8."
exit 1 else echo "Password length requirement met." fi
