Here is a complete, structured set of 35 Challenges (10 Beginner, 15
Intermediate, and 10 Advanced) for Day 05: Loops, Counters & File System
Operations.This set covers while loops, until loops, for loops, C-style
arithmetic iteration, incrementing/decrementing counters (( counter++
)), arithmetic calculation, file system existence checks (-d, -f, -e),
timestamped file/folder generation, string replacements on system
environment variables like
$PATH, and file descriptor / stream iteration.📋 QUESTIONS (Day 05: Challenges 5.1 – 5.35)🟢 Beginner (Challenges 5.1 – 5.10)Challenge 5.1: Write a while loop that initializes a counter=1 and prints "High Five #$counter!
🖐️" while counter is less than or equal to 5. Increment using ((
counter++ )).Challenge 5.2: Create a countdown timer starting at
timer=10. In a while \[ \$timer -gt 0 \] loop, print the timer value,
decrement with (( timer-- )), and sleep 1. Print "🚀 BLAST OFF!" when
done.Challenge 5.3: Write a script that takes a base number as
$1 and uses arithmetic expansion (( product = base * multiplier )) inside a loop to output a 1-to-5 multiplication table line by line.Challenge 5.4: Check if a backup folder "my_backups" exists using if [ ! -d "$backup_folder"
\]. If it does NOT exist, create it using mkdir.Challenge 5.5: Construct
a dynamic backup tarball filename by concatenating variables:
project="website", version=2, and timestamp=\$(date +%Y%m%d). Format:
website_v2_20260807.tar.gz.Challenge 5.6: Take the built-in \$PATH
environment variable and use global string substitution
\${PATH//:/`\n`{=tex}} with echo -e to display every system search
directory on a new line.Challenge 5.7: Write an until loop that starts
with num=1 and runs until num is greater than 5, printing the number on
each step.Challenge 5.8: Check if a regular file "app.log" exists using
\[ -f "app.log" \]. If it exists, print "File found!"; otherwise, print
"File missing!".Challenge 5.9: Calculate the sum of integers from 1 to
10 using a while loop and an accumulator variable sum=0.Challenge 5.10:
Iterate over all .sh files in the current directory using a simple for
loop and print their file names with a \[SCRIPT\] prefix.
