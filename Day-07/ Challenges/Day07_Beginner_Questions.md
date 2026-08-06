📋 QUESTIONS (Day 07: Challenges 7.1 -- 7.35)🟢 Beginner (Challenges 7.1
-- 7.10)Challenge 7.1: Capture the current date and time using
current_time=\$(date) and print "System Time Marker:
$current_time".Challenge 7.2: Count the total number of items in the current directory by capturing a pipeline output: file_count=$(ls
-1 \| wc -l).Challenge 7.3: Query the system's kernel release string
using kernel=\$(uname -r) and output"Active Kernel Version:
\$kernel".Challenge 7.4: Build a Traffic Light Signal Router: accept \$1
as a color string (Green, Yellow, Red) and use if/elif/else to print GO,
SLOW DOWN, STOP, or INVALID SIGNAL.Challenge 7.5: Check if a number \$1
falls within a specific numeric range $10 < n < 50$ using arithmetic
block logical AND: if (( num \> 10 && num \< 50 )).Challenge 7.6:
Capture the current logged-in username into variable
current_user=$(whoami) and verify if it matches "root".Challenge 7.7: Capture the current working directory path using current_dir=$(pwd)
and print "Auditing Directory: \$current_dir".Challenge 7.8: Accept a
numeric test score \$1 and classify it using if/elif/else:
$\ge 90 \rightarrow$ A, $\ge 80 \rightarrow$ B, $\ge 70 \rightarrow$ C,
else $\rightarrow$ F.Challenge 7.9: Verify that an input number
$1 is either less than 0 OR greater than 100 using if (( num < 0 || num > 100 )).Challenge 7.10: Capture the total number of running processes on the system using proc_count=$(ps
aux \| wc -l) and output the total count.
