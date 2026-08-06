🟡 Intermediate (Challenges 5.11 -- 5.25)Challenge 5.11: Write a C-style
for loop in Bash: for (( i=1; i\<=10; i+=2 )) that prints odd numbers
from 1 to 10.Challenge 5.12: Read a target file servers.txt line by line
using a while read -r line loop fed by input redirection \< servers.txt
and print "Checking host: \$line".Challenge 5.13: Write a directory
guard function that takes a directory path as \$1, checks if it exists,
creates it if missing (along with parent directories using mkdir -p),
and logs the action.Challenge 5.14: Write a infinite monitoring loop
while true that checks if a process (e.g., nginx) is running every 3
seconds using pgrep. Break the loop if the process stops.Challenge 5.15:
Generate a sequential batch of 5 timestamped log files named
audit_20260807_01.log through audit_20260807_05.log using a while loop
and printf -v.Challenge 5.16: Parse the \$PATH variable using a while
loop with IFS=":" to check each folder individually, reporting whether
each directory in \$PATH actually exists on the filesystem.Challenge
5.17: Create an interactive retry loop using until: prompt the user for
a secret passphrase "open-sesame". Keep looping until the user types the
correct phrase.Challenge 5.18: Write a script that checks a folder
"logs". If it exists, count how many .log files are inside using a loop;
if it doesn't exist, create it and touch init.log.Challenge 5.19:
Calculate factorials: take a number \$1 (e.g., 5) and compute 5! = 120
using a while loop and arithmetic decrementing.Challenge 5.20: Use break
and continue inside a while loop counting from 1 to 10: skip printing
when the number is 5 (continue), and terminate the loop when the number
hits 8 (break).Challenge 5.21: Build a directory archival script that
iterates through a list of folder names, checks if each exists, and
creates a compressed .tar.gz archive for each valid directory.Challenge
5.22: Safely loop over files with spaces in their names by using
null-delimited find . -type f -print0 piped into while IFS= read -r -d
'' file.Challenge 5.23: Implement a timeout guard loop: wait for a
lockfile /tmp/app.lock to be removed, checking every 1 second, but abort
after 10 seconds if it still exists.Challenge 5.24: Write a loop that
calculates both running total sum and running average of 5 numeric
positional arguments (\$1 through \$5).Challenge 5.25: Construct a
script that checks disk usage of the current folder using du -sh. If a
target directory does not exist, exit early with status 1.
