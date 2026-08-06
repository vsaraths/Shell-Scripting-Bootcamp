🟡 Intermediate (Challenges 8.11 -- 8.25) Challenge 8.11: Build a
3-variable parameter guard: verify that \$1 (env), \$2 (region), and \$3
(cluster) are all present. If ANY variable is empty, print a customized
usage message showing which specific parameter was missing.

Challenge 8.12: Read a 2-line configuration file settings.conf into two
variables primary_ip and backup_ip using a single input redirection
block with { read -r primary_ip; read -r backup_ip; } \< settings.conf.

Challenge 8.13: Search app.log for occurrences of HTTP error status
codes (4xx or 5xx), isolate each matched status code using grep -oE "
\[45\]\[0-9\]{2} ", and output a frequency count of each error code
using sort \| uniq -c.

Challenge 8.14: Write a case-insensitive string normalization function
that accepts two environment names (e.g., "PRODUCTION" and
"production"), converts both to lowercase using \${var,,}, and tests if
they are equal.

Challenge 8.15: Read a key-value file server.ini line-by-line using \<
server.ini. Convert all keys to UPPERCASE using \${key\^\^} while
keeping the values unchanged.

Challenge 8.16: Write an input guard that checks if a required
configuration file app.conf exists AND is non-empty (\[ -s "app.conf"
\]). If invalid, fall back to reading from app.conf.default.

Challenge 8.17: Extract all IPv4 addresses from access.log using grep
-oE "(\[0-9\]{1,3}.){3}\[0-9\]{1,3}" and count how many total IP
instances were extracted.

Challenge 8.18: Take a mixed-case user input string (e.g.,
"dEvOpS-eNgInEeR"), convert it to ALL UPPERCASE using \${var\^\^}, and
replace all hyphens - with underscores \_ using \${var//-/\_}.

Challenge 8.19: Read a multi-line input file nodes.txt into a native
Bash array using readarray -t nodes \< nodes.txt (or mapfile) without
spawning a subshell loop.

Challenge 8.20: Write a defensive input sanitizer that checks if \$1 is
empty (-z). If empty, prompt the user interactively with read -p to
supply the missing parameter.

Challenge 8.21: Isolate and count the number of times the exact word
"CRITICAL" appears in syslog (isolated from "CRITICAL_FAIL") using grep
-o -w "CRITICAL" \| wc -l.

Challenge 8.22: Toggle case conversion: write a function that takes a
word passed as \$1 and swaps uppercase letters to lowercase and vice
versa using native Bash parameter expansion \${var\~\~}.

Challenge 8.23: Safely read a CSV row node01,10.0.0.1,online into
separate variables host, ip, and status using IFS="," read -r host ip
status \< \<(echo "node01,10.0.0.1,online").

Challenge 8.24: Write a parameter guard that checks if a string \$1
contains whitespace or special characters using regex, and enforces
conversion to lowercase alphanumeric format.

Challenge 8.25: Read an environment configuration file, strip all blank
lines and comment lines starting with #, and read active variables into
the current environment session.
