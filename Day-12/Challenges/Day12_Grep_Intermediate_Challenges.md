# 📋 grep Challenges (Day 12) – Intermediate

## Challenge 12.16: Extracting HTTP Status Codes (4xx & 5xx Errors)

**Goal:** Search `nginx_access.log` to find all requests that resulted in client errors (`4xx`) or server errors (`5xx`).

**Input File (`nginx_access.log`)**

```text
10.0.0.1 - - [07/Aug/2026:10:00:01] "GET /home HTTP/1.1" 200 1024
10.0.0.2 - - [07/Aug/2026:10:00:02] "POST /login HTTP/1.1" 401 512
10.0.0.3 - - [07/Aug/2026:10:00:03] "GET /dashboard HTTP/1.1" 200 2048
10.0.0.4 - - [07/Aug/2026:10:00:04] "GET /admin HTTP/1.1" 403 128
10.0.0.5 - - [07/Aug/2026:10:00:05] "POST /api/v1/pay HTTP/1.1" 500 64
```

## Challenge 12.17: Extracting Timestamped Log Entries

Extract log lines between **10:15:00** and **10:19:59**.

```text
[2026-08-07 10:12:01] INFO Worker started
[2026-08-07 10:15:22] WARN High memory usage
[2026-08-07 10:18:45] ERROR Job processing failed
[2026-08-07 10:21:03] INFO Worker finished
```

## Challenge 12.18: Isolate Failed SSH User Attempts

Extract only the usernames from failed SSH login attempts.

```text
Aug  7 10:00:01 server sshd[1234]: Failed password for invalid user admin from 192.168.1.50
Aug  7 10:00:05 server sshd[1235]: Accepted password for deployer from 192.168.1.10
Aug  7 10:00:12 server sshd[1236]: Failed password for root from 10.0.0.1
```

## Challenge 12.19: Counting Unique IP Attacks

Find failed SSH attempts, extract attacker IPs, and count unique addresses.

## Challenge 12.20: Exclude Comments and Empty Lines

Display only active configuration lines.

```text
# Main Server Configuration
port=8080

; Database settings
db_host=localhost
# db_port=5432

timeout=30
```

## Challenge 12.21: Finding Process IDs (PIDs)

Extract PIDs enclosed in square brackets.

```text
Aug 7 10:00:00 systemd[1]: Starting System Logging Service...
Aug 7 10:00:01 cron[845]: (root) CMD (command)
Aug 7 10:00:05 nginx[20491]: Server ready for connections
```

## Challenge 12.22: Matching Valid UUID Pattern

Extract valid UUIDs from `transaction.log`.

## Challenge 12.23: Recursive Log Search with Exclusions

Recursively search `/var/log/app/` for `CRITICAL`, excluding `.gz` files.

## Challenge 12.24: Multi-Word Boundary Exact Filtering

Search for the exact package name `python`.

```text
python3.10 installed
python installed
python3-pip installed
libpython3-stdlib installed
```

## Challenge 12.25: Contextual Crash Investigation

Display 3 lines before and after `Kernel Panic` or `Out of memory`.

```text
[ 120.1] Allocating memory block A
[ 120.2] Allocating memory block B
[ 120.3] High memory pressure detected
[ 120.4] Kernel Panic: Out of memory killer invoked
[ 120.5] Killing process 4521 (java)
[ 120.6] Freeing reserved pages
[ 120.7] System restored to stable state
```
