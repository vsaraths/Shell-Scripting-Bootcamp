# Bash Scripting Challenges 13.26–13.30 - Questions

## 📋 QUESTIONS

### Challenge 13.26: Production Nginx Log KPI Dashboard Engine
**Scenario:** Process `nginx_access.log` to extract:
1. Total bandwidth served (sum of column 10)
2. Total HTTP 5xx errors
3. Average response time (column 11)
4. Display a formatted summary report.

**Input (`nginx_access.log`):**
```text
10.0.0.1 - - [07/Aug/2026:10:00:01 +0000] "GET /index.html HTTP/1.1" 200 1024 0.012
10.0.0.2 - - [07/Aug/2026:10:00:02 +0000] "POST /api/pay HTTP/1.1" 500 512 0.850
10.0.0.3 - - [07/Aug/2026:10:00:03 +0000] "GET /images/logo.png HTTP/1.1" 200 4096 0.005
10.0.0.4 - - [07/Aug/2026:10:00:04 +0000] "GET /checkout HTTP/1.1" 503 256 0.400
```

### Challenge 13.27: SQL Dump Data Sanitization & In-Place Masking
**Scenario:** Mask email addresses and 16-digit credit card numbers in `production_dump.sql` using `sed -i`.

**Input:**
```text
INSERT INTO users VALUES (101, 'john.doe@gmail.com', '4532112233445566');
INSERT INTO users VALUES (102, 'alice.smith@company.org', '4111222233334444');
```

### Challenge 13.28: Multi-File Configuration Drift Reconciler
**Scenario:** Compare `dev.env` and `prod.env` to find keys missing in production.

**dev.env**
```text
PORT=8080
DB_HOST=localhost
LOG_LEVEL=debug
ENABLE_FEATURE_X=true
CACHE_TTL=300
```

**prod.env**
```text
PORT=8080
DB_HOST=prod-db.internal
LOG_LEVEL=error
```

### Challenge 13.29: Stateful Log Session Duration Counter
**Scenario:** Calculate transaction duration from START and END events.

**Input (`transactions.log`):**
```text
TIMESTAMP=1000 txn_id=TXN_A EVENT=TRANSACTION_START
TIMESTAMP=1002 txn_id=TXN_B EVENT=TRANSACTION_START
TIMESTAMP=1005 txn_id=TXN_A EVENT=TRANSACTION_END
TIMESTAMP=1009 txn_id=TXN_B EVENT=TRANSACTION_END
```

### Challenge 13.30: Multi-Line Block Extraction & Automated Key-Value Substitution
**Scenario:** Update only the `api-container` image from `myapp:v1.0.0` to `myapp:v2.1.0`.

**Input (`deployment.yaml`):**
```yaml
containers:
  - name: sidecar-container
    image: myapp:v1.0.0
  - name: api-container
    image: myapp:v1.0.0
  - name: metrics-container
    image: myapp:v1.0.0
```
