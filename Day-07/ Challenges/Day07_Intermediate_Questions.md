🟡 Intermediate (Challenges 7.11 -- 7.25)Challenge 7.11: Capture system
architecture info (uname -m) and operating system name (uname -s) in a
single execution pass and format a metadata card.Challenge 7.12: Check
system uptime: capture uptime in seconds from /proc/uptime, convert to
minutes, and use if/elif/else to report system status (RECENT_REBOOT vs
STABLE).Challenge 7.13: Capture the line count of /etc/passwd using
user_count=\$(wc -l \< /etc/passwd) and classify system size (small vs
enterprise).Challenge 7.14: Write a port validator script: accept a port
number \$1 and check if it sits inside the valid non-privileged user
port range ($1024 \le \text{port} \le 65535$).Challenge 7.15: Build a
multi-tier HTTP status code evaluator: capture HTTP status code using
curl and evaluate response codes ($200-299 \rightarrow$ OK,
$300-399 \rightarrow$ REDIRECT, $400-499 \rightarrow$ CLIENT_ERR,
$500-599 \rightarrow$ SERVER_ERR).Challenge 7.16: Combine pipeline
command substitution with file size checks: capture size in bytes of a
target log file and trigger an alert if size is between $10\,\text{MB}$
($10,485,760$ bytes) and $50\,\text{MB}$ ($52,428,800$ bytes).Challenge
7.17: Create a dynamic timestamped directory creation utility:
ts=$(date +%Y%m%d_%H%M%S) and create directory /tmp/audit_$ts.Challenge
7.18: Evaluate system CPU load averages: capture the 1-minute load
average using awk on /proc/loadavg and classify system load (LOW,
MODERATE, CRITICAL).Challenge 7.19: Build a multi-branch IP address
octet check: capture the local IP address and classify whether it
belongs to class A (10.x.x.x), class B (172.16.x.x), or class C
(192.168.x.x).Challenge 7.20: Check active user login sessions: capture
count using logged_users=\$(who \| wc -l). If count is 0, print
NO_USERS; elif count $\le 5$, print NORMAL; else print
HIGH_CONCURRENCY.Challenge 7.21: Combine arithmetic logical evaluation
with string presence checks: check if a file exists AND its line count
is between 50 and 200 lines.Challenge 7.22: Capture disk space available
on root / in Gigabytes using df -BG / and evaluate if available space is
within safe operational limits ($> 5\,\text{GB}$).Challenge 7.23: Build
a multi-branch file age auditor: capture file modification timestamp
epoch using date -r and classify file age (FRESH, STALE,
ARCHIVE_READY).Challenge 7.24: Validate system memory usage ratio:
capture total and available RAM using free -m, calculate percentage, and
verify if usage is bounded between 60% and 85%.Challenge 7.25: Build an
interactive environmental inspector menu: capture OS type, kernel
version, hostname, and current user into separate variables, presenting
them in a clean status box.
