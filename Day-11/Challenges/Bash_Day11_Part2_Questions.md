📋 QUESTIONS (Day 11: Challenges 11.16 -- 11.35) Challenge 11.16:
Non-Blocking File Descriptor Locks Scenario: Open custom File Descriptor
4 on /tmp/deploy.lock using exec 4\>. Use flock -n 4 to attempt an
atomic lock. If another process holds the lock, print an error and exit;
otherwise, proceed with execution.

Challenge 11.17: Atomic Configuration Writes via Temporary Files
Scenario: Prevent race conditions when writing /etc/app.conf. Redirect
output into a temporary file using cat \<\< 'EOF' \> /tmp/app.conf.tmp,
verify its syntax, and use atomic move (mv) to update the target file.

Challenge 11.18: Dynamic Log Splitting by File Descriptor Scenario:
Create a script that opens FD 3 for info logs (/tmp/info.log) and FD 4
for error logs (/tmp/error.log). Write a wrapper function log_out that
writes to FD 3 or FD 4 based on parameter level without opening and
closing files repeatedly.

Challenge 11.19: Process Substitution Stream Merging Scenario: Use
process substitution \<(...) and paste or join to combine sorted output
from two separate live running subshells (seq 1 5 and seq 6 10) side by
side into a single stream.

Challenge 11.20: Silent Pipeline Failure Interception (pipefail + exec)
Scenario: Construct a pipeline where command 1 fails silently inside a
subshell. Use set -o pipefail combined with file descriptor redirection
to capture both the pipeline failure exit status and the error message
into a log file without halting the parent script abruptly.

Challenge 11.21: Redirecting Input Streams into Interactive Loops
Scenario: Read a CSV file nodes.csv line by line using FD 3 (while IFS=,
read -u 3 -r host ip role; do ... done 3\< nodes.csv) while leaving
standard input (FD 0) open for interactive user input (read -p) inside
the loop.

Challenge 11.22: In-Memory File Descriptor Buffering (/dev/shm)
Scenario: Redirect heavy log stream outputs into an in-memory file
descriptor stored in shared memory (/dev/shm/stream.tmp) to reduce disk
I/O, process the stream, and clear it on script exit.

Challenge 11.23: Dual Log Routing with Named Pipes (FIFOs) Scenario:
Create a named pipe using mkfifo /tmp/log_pipe. In the background, read
from /tmp/log_pipe using awk to filter for errors while the main script
writes output directly into /tmp/log_pipe.

Challenge 11.24: Isolating Subshell STDERR from Parent Environment
Scenario: Execute a dangerous subshell command block ( cd /nonexistent
&& rm -rf \* ) where standard error inside the subshell is redirected
into a variable or file without polluting the main script's standard
error stream.

Challenge 11.25: Multi-File Redirection via exec Re-assignment Scenario:
Write a script that dynamically reassigns STDOUT (FD 1) and STDERR (FD
2) to /tmp/setup.log for a specific setup block using exec, then
restores STDOUT and STDERR back to the original terminal screen at the
end.

Challenge 11.26: Reading Binary Data and Hex Inspection via Pipes
Scenario: Stream the first 64 bytes of /dev/urandom into hexdump or xxd
using a pipe, format it as a continuous 32-character hexadecimal string,
and save it to a variable without writing binary garbage to the
terminal.

Challenge 11.27: Suppressing Pipeline Death Warnings (SIGPIPE) Scenario:
Run cat /dev/urandom piped into head -c 100. Prevent the pipeline from
emitting a non-zero exit status or Broken pipe warning under strict mode
(set -euo pipefail).

Challenge 11.28: Telematic Log Duplication with Conditional Filtering
Scenario: Duplicate a command's STDOUT to both standard terminal display
and an audit file using tee, but filter out all DEBUG entries before
writing to the file while keeping DEBUG visible on screen.

Challenge 11.29: Custom Bidirectional Pipe Communication Scenario: Use
two custom file descriptors (FD 3 and FD 4) to establish a 2-way data
stream channel between a parent process and a background worker loop.

Challenge 11.30: Capturing Execution Timestamps via Pipe Wrapper
Scenario: Write a pipe filter function timestamp_stream that reads STDIN
line-by-line and prepends each line with an ISO-8601 timestamp
(YYYY-MM-DDTHH:MM:SS) before emitting it to STDOUT.

Challenge 11.31: Concurrent Multi-Stream Processing Scenario: Process
standard output and standard error simultaneously through two separate
awk filters in a single pipeline execution using process substitution
(\> \>(awk ...) 2\> \>(awk ...)).

Challenge 11.32: File Descriptor Duplication Memory Check Scenario:
Verify if custom File Descriptor 3 is currently open and writeable
before attempting to write to it, redirecting output safely or falling
back to STDOUT if unopened.

Challenge 11.33: Dynamic Log Rotation via Stream Redirection Scenario:
Write a loop that redirects output to a log file whose name changes
dynamically every minute (app\_\$(date +%Y%m%d\_%H%M).log) using exec
re-allocations inside the running process.

Challenge 11.34: Here-Doc Variable Expansion Neutralization Scenario:
Write a Here-Doc script generator cat \<\< 'EOF' \> script.sh that
writes literal Bash variable syntax (like \$1, \$VAR) into the output
file without expanding them during parent execution.

Challenge 11.35: File Descriptor Cleanup under Abrupt Signals Scenario:
Register a signal handler on SIGTERM / EXIT that explicitly closes all
opened custom file descriptors (FD 3, 4, 5) and removes associated lock
files cleanly.
