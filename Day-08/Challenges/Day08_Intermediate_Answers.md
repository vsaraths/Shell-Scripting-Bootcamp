🟡 Intermediate Answers (8.11 -- 8.25) Answer 8.11 Bash #!/bin/bash
env="${1:-}"
region="${2:-}" cluster="\${3:-}"

if \[ -z "\$env" \]; then echo "Error: Parameter 1 (Environment) is
required!" \>&2 exit 1 fi

if \[ -z "\$region" \]; then echo "Error: Parameter 2 (Region) is
required!" \>&2 exit 1 fi

if \[ -z "\$cluster" \]; then echo "Error: Parameter 3 (Cluster) is
required!" \>&2 exit 1 fi

echo "Parameters validated: Env=$env, Region=$region, Cluster=\$cluster"
Answer 8.12 Bash #!/bin/bash cat \<\< 'EOF' \> settings.conf 10.0.0.1
10.0.0.2 EOF

{ read -r primary_ip read -r backup_ip } \< settings.conf

echo "Primary IP : \$primary_ip" echo "Backup IP : \$backup_ip"

rm -f settings.conf Answer 8.13 Bash #!/bin/bash cat \<\< 'EOF' \>
app.log GET /index 200 POST /login 401 GET /dashboard 500 POST /pay 500
GET /about 404 EOF

echo "HTTP Error Code Frequencies:" grep -oE " \[45\]\[0-9\]{2} "
app.log \| sort \| uniq -c

rm -f app.log Answer 8.14 Bash #!/bin/bash env1="PRODUCTION"
env2="production"

norm1="${env1,,}"
norm2="${env2,,}"

if \[ "$norm1" = "$norm2" \]; then echo "Match: Environments are
equivalent ('$norm1' == '$norm2')" else echo "Mismatch:
'$norm1' != '$norm2'" fi Answer 8.15 Bash #!/bin/bash cat \<\< 'EOF' \>
server.ini port=8080 host=localhost debug=true EOF

while IFS="=" read -r key val \|\| \[ -n "$key" ]; do
  [ -z "$key" \] && continue upper_key="\${key\^\^}" echo "Normalized
Config: ${upper_key}=${val}" done \< server.ini

rm -f server.ini Answer 8.16 Bash #!/bin/bash cat \<\< 'EOF' \>
app.conf.default HOST=default-host.internal EOF

target_config="app.conf"

if \[ -s "\$target_config" \]; then echo "Loading active configuration
from $target_config"
  read -r active_host < "$target_config" else echo "Active config
missing or empty. Falling back to default..." read -r active_host \<
app.conf.default fi

echo "Active Configuration: \$active_host" rm -f app.conf.default Answer
8.17 Bash #!/bin/bash cat \<\< 'EOF' \> access.log 192.168.1.1 - GET
/index 10.0.0.55 - POST /login 192.168.1.1 - GET /favicon.ico EOF

ip_count=\$(grep -oE "(\[0-9\]{1,3}.){3}\[0-9\]{1,3}" access.log \| wc
-l) echo "Total IP occurrences extracted: \$ip_count"

rm -f access.log Answer 8.18 Bash #!/bin/bash
raw_input="dEvOpS-eNgInEeR" upper_str="${raw_input^^}"
clean_str="${upper_str//-/\_}"

echo "Transformed Output: \$clean_str" Answer 8.19 Bash #!/bin/bash cat
\<\< 'EOF' \> nodes.txt node01.internal node02.internal node03.internal
EOF

readarray -t nodes \< nodes.txt

echo "Total nodes loaded into array: \${#nodes\[@\]}" echo "Node 1:
\${nodes\[0\]}" echo "Node 2: \${nodes\[1\]}"

rm -f nodes.txt Answer 8.20 Bash #!/bin/bash target_env="\${1:-}"

if \[ -z "\$target_env" \]; then echo "Warning: Target environment not
supplied as positional argument!" read -r -p "Enter target environment
(dev/staging/prod):" target_env fi

echo "Proceeding with target environment: \$target_env" Answer 8.21 Bash
#!/bin/bash cat \<\< 'EOF' \> syslog CRITICAL System failed
CRITICAL_FAIL Non matching pattern CRITICAL Service restarted EOF

count=\$(grep -o -w "CRITICAL" syslog \| wc -l) echo "Exact matches for
'CRITICAL': \$count"

rm -f syslog Answer 8.22 Bash #!/bin/bash word="DevOps2026" \# \~\~
swaps upper to lower and lower to upper swapped="\${word\~\~}" echo
"Original : \$word" echo "Swapped : \$swapped" Answer 8.23 Bash
#!/bin/bash IFS="," read -r host ip status \< \<(echo
"node01,10.0.0.1,online")

echo "Host : \$host" echo "IP : \$ip" echo "Status : $status"
Answer 8.24
Bash
#!/bin/bash
raw_name="${1:-My App Name!}"

if \[ -z "\$raw_name" \]; then echo "Error: Name cannot be empty!" \>&2
exit 1 fi

lower="${raw_name,,}"
clean="${lower//\[\^a-z0-9\]/\_}"

echo "Sanitized name: \$clean" Answer 8.25 Bash #!/bin/bash cat \<\<
'EOF' \> env.conf \# Database Settings DB_HOST=127.0.0.1

# Application Settings

APP_PORT=8080 EOF

while read -r line \|\| \[ -n "$line" ]; do
  # Ignore empty lines and comment lines
  [[ -z "$line" \|\| "\$line" =\~ [^1]\*# \]\] && continue echo "Loaded:
\$line" done \< env.conf

rm -f env.conf

[^1]: \[:space:\]
