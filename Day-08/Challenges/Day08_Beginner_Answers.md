🟢 Beginner Answers (8.1 -- 8.10) Answer 8.1 Bash #!/bin/bash if \[ -z
"${1:-}" ] || [ -z "${2:-}" \]; then echo "Error: Missing parameters!
Usage: \$0 `<server>`{=html} `<environment>`{=html}" \>&2 exit 1 fi

echo "Deploying to Server: \$1 \| Environment: \$2" Answer 8.2 Bash
#!/bin/bash \# Create dummy file for testing echo "prod-db-01.internal"
\> host.txt

read -r active_host \< host.txt echo "Active Host: \$active_host"

rm -f host.txt Answer 8.3 Bash #!/bin/bash \# Create dummy log for
testing echo "every node every pod every container" \> logs.txt

count=\$(grep -o "every" logs.txt \| wc -l) echo "Total occurrences of
'every': \$count"

rm -f logs.txt Answer 8.4 Bash #!/bin/bash tool="ansible"
uppercase_tool="\${tool\^\^}" echo "Uppercase: $uppercase_tool"
Answer 8.5
Bash
#!/bin/bash
CLOUD="AWS_KUBERNETES"
lowercase_cloud="${CLOUD,,}" echo "Lowercase: $lowercase_cloud"
Answer 8.6
Bash
#!/bin/bash
if [ -n "${1:-}" \]; then echo "Valid input: \$1" else echo "No argument
supplied!" fi Answer 8.7 Bash #!/bin/bash cat \<\< 'EOF' \> config.env
PORT=8080 ENV=production EOF

while read -r line; do \[ -z "\$line" \] && continue echo "Setting:
\$line" done \< config.env

rm -f config.env Answer 8.8 Bash #!/bin/bash role="developer"
capitalized="\${role\^}" echo "Capitalized: $capitalized"
Answer 8.9
Bash
#!/bin/bash
STATUS="ACTIVE"
lower_first="${STATUS,}" echo "Lower first char: \$lower_first" Answer
8.10 Bash #!/bin/bash cat \<\< 'EOF' \> users.txt Admin:
admin@company.com Dev: dev-team@cloud.net EOF

echo "Extracted Email Addresses:" grep -oE
"\[a-zA-Z0-9.\_%+-\]+@\[a-zA-Z0-9.-\]+.\[a-zA-Z\]{2,}" users.txt

rm -f users.txt
