# Advanced Questions

🔴 Advanced (Challenges 3.26 – 3.35)
Challenge 3.26: Build a robust CLI argument parser: handle options -n <name>, -a <age>, and positional files using shift and parameter inspection.

Challenge 3.27: Calculate exact memory usage ratios: capture total and free RAM in MB, compute used RAM percentage using $(( (used * 100) / total )), and trigger threshold alerts.

Challenge 3.28: Implement a dice probability simulator: simulate rolling two 6-sided dice 100 times in a loop, calculating the sum (( dice = (RANDOM % 6 + 1) + (RANDOM % 6 + 1) )) and tracking sum frequencies into an array.

Challenge 3.29: Parse complex multi-file inputs passed as positional arguments: verify existence, check read permissions, and calculate total aggregated line count across all valid files.

Challenge 3.30: Compute average response latency: take a list of latency numbers in milliseconds as positional arguments, calculate total sum and average (( avg = sum / $# )), and format the output.

Challenge 3.31: Build a zero-subshell age calculator: take user birth year as $1, query current year dynamically using date +%Y, and compute age (( age = current_year - $1 )).

Challenge 3.32: Construct a weighted random selector: pass 3 probability weights as $1, $2, $3 (e.g., 50 30 20), generate a random number from 1 to 100, and route to corresponding buckets.

Challenge 3.33: Implement arithmetic bitwise operations inside (( )): demonstrate bitwise AND (&), bitwise OR (|), bitwise XOR (^), and bit shifting (<<, >>) on input flags.

Challenge 3.34: Construct an atomic rate-limiter incrementer: use a file counter, read current count, increment inside (( count++ )), and write back atomically under lock control.

Challenge 3.35: Synthesis Capstone — Wizard Exam Synthesis (challenge-15-wizard-exam.sh): accept user name ($1) and birth year ($2), validate argument presence, verify integer format, calculate current age dynamically, compute a randomized wizard power score ($(( RANDOM % 100 + 1 ))), check if an optional spellbook file passed as $3 exists, and generate an ANSI wizard report card.