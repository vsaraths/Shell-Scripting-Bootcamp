# 📋 grep Challenges (Day 12)

## Challenge 12.1: Case-Insensitive Search

**Goal:** Search for the word `error` in `app.log` regardless of case (`ERROR`, `Error`, `error`).

**Input File (`app.log`)**

```text
[INFO] System startup complete
[ERROR] Failed to load database configuration
[WARNING] Disk usage high
[error] Socket connection timed out
```

---

## Challenge 12.2: Inverted Filtering

**Goal:** Print all lines from `syslog.txt` except those containing `INFO`.

**Input File (`syslog.txt`)**

```text
INFO User login ok
WARN Disk usage > 80%
INFO Cache refreshed
CRITICAL Database unreachable
```

---

## Challenge 12.3: Line Numbers & Exact Word Search

**Goal:** Find the exact line number where the word `failed` appears as an isolated word.

**Input File (`auth.log`)**

```text
Session initialized
Authentication failed for user root
Total failed_attempts = 3
Session terminated
```

---

## Challenge 12.4: Counting Matches

**Goal:** Count the total number of HTTP `404` errors in `access.log`.

**Input File (`access.log`)**

```text
192.168.1.1 GET /index.html 200
192.168.1.5 GET /favicon.ico 404
10.0.0.2 POST /api/login 200
192.168.1.10 GET /missing.php 404
172.16.0.1 GET /images/logo.png 404
```

---

## Challenge 12.5: Line Anchors

**Goal:** Find lines that start with `CRITICAL` or end with `failed`.

**Input File (`audit.log`)**

```text
CRITICAL: Out of memory space
WARNING: Disk full, check failed
CRITICAL process killed
INFO: Process status failed
INFO: Operational status OK
```

---

## Challenge 12.6: Multiple Files Search

**Goal:** Search for `DB_ERROR` across all `.log` files in the current folder and display the filename.

---

## Challenge 12.7: Context Lines Before & After

**Goal:** Print the line containing `FATAL`, along with 1 line before it and 2 lines after it.

**Input File (`server.log`)**

```text
[10:00] Initializing database connections
[10:01] Attempting connection to host 10.0.0.5...
[10:02] FATAL: Database host unreachable
[10:03] Falling back to secondary server
[10:04] Secondary connection established
```

---

## Challenge 12.8: IPv4 Address Regex

**Goal:** Match lines containing IPv4 addresses.

**Input File (`connections.log`)**

```text
Connection from 192.168.1.100 port 22
Local loopback request from 127.0.0.1
Host domain www.example.com resolving
```

---

## Challenge 12.9: Quiet Mode Exists Check

**Goal:** Check silently if `CRITICAL` exists inside `system.log`. Print your own message without printing the matching line.

---

## Challenge 12.10: Character Set Choices

**Goal:** Match `HTTP/1.0`, `HTTP/1.1`, or `HTTP/2.0`.

**Input File (`web.log`)**

```text
GET /index.html HTTP/1.0
POST /login HTTP/1.1
GET /api/v1 HTTP/2.0
GET /legacy HTTP/0.9
```

---

## Challenge 12.11: Extract Matched Text Only

**Goal:** Extract only the email addresses from `users.txt`.

**Input File (`users.txt`)**

```text
Contact administrator admin@company.com for help.
Support representative devops-team@cloud.net assigned.
```

---

## Challenge 12.12: Blank Lines Count

**Goal:** Count the number of blank lines in `config.conf`.

**Input File (`config.conf`)**

```text
PORT=8080

HOST=127.0.0.1

DEBUG=true
```

---

## Challenge 12.13: Multi-Pattern Matching

**Goal:** Search for lines containing either `WARN` or `FAIL`.

**Input File (`app.log`)**

```text
INFO Service started
WARN High memory consumption
INFO Task queued
FAIL Task processing dropped
```

---

## Challenge 12.14: List Files Matching Pattern

**Goal:** Print only the filenames of `.log` files containing `CRITICAL_ERROR`.

---

## Challenge 12.15: Optional Quantifier

**Goal:** Match URLs beginning with either `http://` or `https://`.

**Input File (`web_traffic.log`)**

```text
Request routed to http://api.internal
Secure request routed to https://secure.payment.com
FTP request ftp://files.local
```
