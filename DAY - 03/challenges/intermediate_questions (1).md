# Intermediate Questions

🟡 Intermediate (Challenges 3.11 – 3.25)
Challenge 3.11: Write a script that requires exactly two arguments ($1 and $2). Check argument count with if (( $# != 2 )); if false, print an error and exit with status 1.

Challenge 3.12: Implement fallback defaults for positional parameters: if $1 is missing, default to "Guest" using ${1:-Guest}.

Challenge 3.13: Differentiate between $* and $@ when quoted inside a loop: iterate over "$*" vs "$@" to demonstrate how word splitting behaves.

Challenge 3.14: Write a script that accepts a file path as $1 and a line count as $2. Verify that $1 exists ([ -f "$1" ]) before running head -n "$2" "$1".

Challenge 3.15: Build a simple command-line calculator that takes $1 (Number 1), $2 (Operator: +, -, *), and $3 (Number 2) and performs the evaluation inside (( )).

Challenge 3.16: Generate a random number within a dynamic range between $1 (Min) and $2 (Max) using formula (( rand = min + RANDOM % (max - min + 1) )).

Challenge 3.17: Shift positional parameters: process $1, run shift, and demonstrate how the new $1 holds what was previously $2.

Challenge 3.18: Calculate floating-point division using bc or awk since Bash (( )) performs integer-only truncation (e.g., 5 / 2 = 2.50).

Challenge 3.19: Write a batch file size accumulator: iterate through all files passed as positional arguments ("$@") and sum their file sizes in bytes using wc -c and arithmetic accumulation.

Challenge 3.20: Capture the script name itself using $0 and strip path prefixes using ${0##*/} to display a clean usage help guide.

Challenge 3.21: Swap two numeric variables a=$1 and b=$2 without using a third temporary variable, using pure arithmetic addition and subtraction operations inside (( )).

Challenge 3.22: Check if an input integer $1 is a multiple of both 3 and 5 using if (( $1 % 3 == 0 && $1 % 5 == 0 )).

Challenge 3.23: Compute compound interest or power growth using arithmetic loops: multiply a base principal $1 by rate $2 across $3 iterations inside a while loop.

Challenge 3.24: Build an argument guard that checks if $1 is a valid integer using regex [[ "$1" =~ ^-?[0-9]+$ ]] before attempting arithmetic operations.

Challenge 3.25: Read the last positional parameter dynamically without knowing the total argument count beforehand using ${!#}.