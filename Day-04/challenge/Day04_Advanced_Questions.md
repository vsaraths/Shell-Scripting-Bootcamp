🔴 Advanced (Challenges 4.26 -- 4.35)Challenge 4.26: Build an
interactive CLI login prompt that takes a username, securely prompts for
a password twice, verifies that both passwords match, and ensures the
password length is at least 8 characters.Challenge 4.27: Parse a
database connection string
postgres://admin:secret123@db.internal:5432/prod_db using purely
parameter expansions (#, ##, %, %%, :) to extract user, password, host,
port, and database without spawning subshells (awk, sed, cut).Challenge
4.28: Build a non-blocking interactive prompt that waits 3 seconds for
user input, falls back to a default setting if timed out, and suppresses
terminal output during prompt interrupts.Challenge 4.29: Write a string
sanitizer function that takes a raw file name input from a user,
replaces all spaces and special characters with underscores \_, and
converts the entire string to lowercase using parameter
expansions.Challenge 4.30: Extract a dynamic substring window from a log
line where the start offset and substring length are calculated
dynamically via arithmetic expressions inside the slicing expansion
${var:start:len}.Challenge 4.31: Build a secret key masking utility that takes a 32-character API key (e.g., AKIAIOSFODNN7EXAMPLEKEY123456789) and outputs it in masked format showing only the first 4 and last 4 characters (AKIA************************2026).Challenge 4.32: Implement a zero-subshell path parser that takes a URL string [https://staging.api.v1.domain.com:8443/v1/health](https://staging.api.v1.domain.com:8443/v1/health) and extracts the protocol (https), hostname (staging.api.v1.domain.com), port (8443), and endpoint path (/v1/health).Challenge 4.33: Process an array of file paths in a loop, applying prefix stripping (${path#\*/})
and extension swapping (\${file/%.txt/.log}) using in-place parameter
modifications.Challenge 4.34: Construct an interactive tabular menu
where read -e -i "default_val" uses Readline capability to pre-fill the
input prompt with a default editable value.Challenge 4.35: Write a
complete input sanitization & configuration generator CLI script that
interactively collects system parameters, enforces strict mode defaults
(set -euo pipefail), applies string transformations, and outputs a
formatted .env file.
