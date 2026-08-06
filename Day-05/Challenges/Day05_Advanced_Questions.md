🔴 Advanced (Challenges 5.26 -- 5.35)Challenge 5.26: Build an automated
log rotator daemon simulator: run a while loop that monitors a target
log file app.log. When app.log exceeds 5 lines or a simulated size,
rename it to app.log.YYYYMMDD_HHMMSS, touch a fresh app.log, and
increment a rotation counter.Challenge 5.27: Implement a multi-file
batch renaming script using a while loop that reads filenames from
STDIN, checks if each file exists, strips the old extension using
${file%.*}, and renames them to a timestamped format.Challenge 5.28: Build a resilient process watcher loop with exponential backoff: attempt to connect to a service endpoint up to 5 times. On each failure, double the sleep interval (1s, 2s, 4s, 8s, 16s) before retrying.Challenge 5.29: Write a zero-subshell directory tree walker using for globs and recursion: traverse subdirectories, check for file vs directory types (-f vs -d), and accumulate total file and directory counts.Challenge 5.30: Read a CSV configuration file clusters.csv using while IFS=',' read -r cluster_id node_ip region while ensuring empty lines and comment lines starting with # are skipped.Challenge 5.31: Build an atomic file deployment guard: check if a target release directory exists. If missing, create a temporary directory release.tmp.$\$,
populate it, and atomically move (mv) it to the final target folder
name.Challenge 5.32: Construct a dual-counter rate limiter: use an outer
loop for time intervals (e.g., minutes) and an inner loop for request
counts. Reset the inner request counter when the outer time interval
increments.Challenge 5.33: Process large system files in batches: read
an input file data.txt in chunks of 5 lines using a while loop and write
each 5-line chunk into sequentially numbered batch files (batch_1.txt,
batch_2.txt).Challenge 5.34: Write a PATH hygiene analyzer: parse
\$PATH, check for duplicate entries in the list using an associative
array inside a while loop, and construct a cleaned \$PATH string free of
duplicates.Challenge 5.35: Build a full production backup agent script
using set -euo pipefail: validate source directory existence, verify
destination path, loop through retention backups to delete archives
older than $N$ cycles, and output execution metrics.
