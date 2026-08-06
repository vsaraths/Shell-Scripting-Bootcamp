🟡 Intermediate (Challenges 4.11 -- 4.25)Challenge 4.11: Differentiate
between \${var:-default} (fallback if unset/null) and \${var:=default}
(assigns the default value to the variable permanently if
unset/null).Challenge 4.12: Enforce mandatory variable validation using
\${var:?error_message} so the script terminates automatically with an
error if a required input is missing.Challenge 4.13: Given a full file
path /var/log/nginx/access.log, strip the shortest matching leading path
up to the last slash using \${path##*/} to isolate the filename
(access.log).Challenge 4.14: Given a full filename deployment_v2.tar.gz,
strip the longest trailing extension suffix using \${filename%%.*} to
extract just the base name (deployment_v2).Challenge 4.15: Given a log
entry string, replace the FIRST occurrence of "http://" with "https://"
using \${var/http:///https://}.Challenge 4.16: Given a multiline or
repeated text string, replace ALL occurrences of "localhost" with
"127.0.0.1" using global parameter replacement
\${var//localhost/127.0.0.1}.Challenge 4.17: Convert a string variable
APP_ENV="production" to ALL UPPERCASE using \${APP_ENV\^\^} without
calling tr or awk.Challenge 4.18: Convert a header string variable
HEADER="AUTHORIZATION" to all lowercase using \${HEADER,,}.Challenge
4.19: Capitalize ONLY the first letter of a lowercase string variable
role="admin" using \${role\^}.Challenge 4.20: Extract a substring from
the END of a string using negative offset slicing (e.g., \${var:
-4}).Challenge 4.21: Prompt a user for a secret PIN with a maximum
length of 4 digits using read -s -n 4.Challenge 4.22: Read input with a
custom delimiter (e.g., reading a comma-separated string) using read -d
",".Challenge 4.23: Replace a pattern ONLY if it occurs at the START of
a string using \${var/#pattern/replacement}.Challenge 4.24: Replace a
pattern ONLY if it occurs at the END of a string using
\${var/%pattern/replacement}.Challenge 4.25: Validate if a user-supplied
string meets a minimum character length threshold (e.g., password must
be $\ge 8$ characters) using \${#var} in a conditional test.
