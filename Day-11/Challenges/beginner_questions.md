# Beginner Questions

🟢 Beginner (Challenges 11.1 – 11.10)
Challenge 11.1: Print a system execution stamp combining $USER, $HOSTNAME, and current line number ${LINENO}.

Challenge 11.2: Generate a random 4-digit execution session ID using $(( 1000 + RANDOM % 9000 )).

Challenge 11.3: Format an ISO-8601 UTC timestamp string using date -u +"%Y-%m-%dT%H:%M:%SZ".

Challenge 11.4: Prompt the user interactively with read -p "Enter Target Region [us-east-1]: " -r and default to us-east-1 if empty.

Challenge 11.5: Iterate over an array of 3 microservices services=("auth" "billing" "shipping") and output a status report for each.

Challenge 11.6: Combine user input, a random ID, and a timestamp into a single log file path string /tmp/deploy_<user>_<id>_<timestamp>.log.

Challenge 11.7: Capture script execution line numbers dynamically at key execution steps using echo "[STEP at Line ${LINENO}] Task completed.".

Challenge 11.8: Write an array of 3 server hostnames to a temporary file hosts.tmp line by line using file redirection.

Challenge 11.9: Count total positional arguments passed to the pipeline runner $# and print a warning if no arguments are provided.

Challenge 11.10: Synthesize $USER, $HOSTNAME, and date into an environment header box.