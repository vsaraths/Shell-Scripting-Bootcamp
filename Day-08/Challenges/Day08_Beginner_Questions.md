Here is a complete, structured set of 35 Challenges (10 Beginner, 15
Intermediate, and 10 Advanced) for Day 08: Input Guards & Text
Manipulation.

This module covers defensive input checks (\[ -z
"$var" ]), file input redirection (<), pattern extraction using grep -o with counts (wc -l), native Bash case conversion (${var\^\^},
\${var,,}, \${var\^}, \${var,}), and string trimming.

📋 QUESTIONS (Day 08: Challenges 8.1 -- 8.35) 🟢 Beginner (Challenges
8.1 -- 8.10) Challenge 8.1: Write a multi-variable input guard that
checks if either \$1 OR \$2 is empty using if \[ -z "\$1" \] \|\| \[ -z
"\$2" \]. If either is empty, print "Missing parameters!" and exit with
code 1.

Challenge 8.2: Read the first line of a configuration file host.txt
directly into a variable active_host using input redirection read -r
active_host \< host.txt.

Challenge 8.3: Search a file logs.txt for the pattern "every", extract
ONLY the matched instances on separate lines using grep -o, and pipe to
wc -l to count total occurrences.

Challenge 8.4: Convert a string variable tool="ansible" to ALL UPPERCASE
(ANSIBLE) using native Bash parameter expansion \${tool\^\^}.

Challenge 8.5: Convert a string variable CLOUD="AWS_KUBERNETES" to all
lowercase (aws_kubernetes) using native Bash parameter expansion
\${CLOUD,,}.

Challenge 8.6: Check if a positional argument \$1 is NON-EMPTY using if
\[ -n "\$1" \]. If non-empty, print "Valid input: \$1".

Challenge 8.7: Read the contents of a file config.env line by line using
a while read -r line loop fed by input redirection \< config.env.

Challenge 8.8: Convert ONLY the first character of a lowercase variable
role="developer" to uppercase (Developer) using \${role\^}.

Challenge 8.9: Convert ONLY the first character of an uppercase variable
STATUS="ACTIVE" to lowercase (aCTIVE) using \${STATUS,}.

Challenge 8.10: Extract all email addresses from a file users.txt using
grep -oE "\[a-zA-Z0-9.\_%+-\]+@\[a-zA-Z0-9.-\]+.\[a-zA-Z\]{2,}".
