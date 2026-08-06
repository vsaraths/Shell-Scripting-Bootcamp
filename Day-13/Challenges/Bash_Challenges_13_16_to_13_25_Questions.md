# Bash Scripting Challenges 13.16–13.25 - Questions

## Challenge 13.16: Multi-Delimiter CSV & Pipeline Log Parsing
**Scenario:** Parse `metrics.csv` containing mixed delimiters (`,` and `:`). Extract the hostname (field 1) and memory usage percentage (after `mem:`).

**Input (`metrics.csv`):**
```text
web-node-01,status:ok,mem:78%
db-node-01,status:warn,mem:92%
cache-node-01,status:ok,mem:45%
```

## Challenge 13.17: Selective Text Substitution in Specific Lines
**Scenario:** Replace `ENVIRONMENT=staging` with `ENVIRONMENT=production` only on non-comment lines.

**Input (`deploy.sh`):**
```text
# Default setting: ENVIRONMENT=staging
ENVIRONMENT=staging
echo "Deploying to $ENVIRONMENT"
```

## Challenge 13.18: In-Place Multi-Pattern Editing with SED Backreferences
**Scenario:** Convert `ip:port` into `HOST=<ip> PORT=<port>`.

**Input (`services.txt`):**
```text
web: 192.168.1.10:80
api: 10.0.0.5:443
db: 172.16.0.2:5432
```

## Challenge 13.19: Conditional Group Aggregation in AWK
**Scenario:** Calculate average latency for 2xx and 5xx responses.

**Input (`access.log`):**
```text
GET /index 200 120ms
POST /login 500 450ms
GET /about 200 80ms
POST /pay 500 550ms
```

## Challenge 13.20: Advanced String Trimming and Cleanup
**Scenario:** Remove quotes and trailing commas from JSON-like entries.

**Input (`raw.txt`):**
```text
"db_host": "10.0.0.1",
"db_port": "5432",
"db_pass": "secret123",
```

## Challenge 13.21: Range Processing between Patterns
**Scenario:** Extract text between `--- BEGIN DEPLOY ---` and `--- END DEPLOY ---`.

**Input (`build.log`):**
```text
[00:01] Init workspace
--- BEGIN DEPLOY ---
[00:02] Pulling Docker image
[00:03] Running container
--- END DEPLOY ---
[00:04] Cleanup temporary files
```

## Challenge 13.22: Stateful AWK Record Tracking
**Scenario:** Count duplicate user IDs using an associative array.

**Input (`audit.log`):**
```text
user_id: 101 action: login
user_id: 102 action: login
user_id: 101 action: logout
user_id: 103 action: login
user_id: 101 action: login
```

## Challenge 13.23: Formatting AWK Output as Markdown
**Scenario:** Convert `proc.txt` into a Markdown table.

**Input (`proc.txt`):**
```text
PID Process Memory
101 nginx 120MB
202 mysqld 512MB
303 redis 64MB
```

## Challenge 13.24: Multi-Line Append/Insert with SED
**Scenario:** Insert `max_connections=500` immediately after `[database]`.

**Input (`app.ini`):**
```text
[server]
port=8080

[database]
host=localhost
port=5432
```

## Challenge 13.25: Dynamic Field Manipulation and Filtering
**Scenario:** Convert USD to EUR (×0.9) and print values greater than 50 EUR.

**Input (`sales.txt`):**
```text
Item_A 40.00
Item_B 100.00
Item_C 55.00
Item_D 20.00
```
