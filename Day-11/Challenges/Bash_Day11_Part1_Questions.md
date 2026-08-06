### 💡 Core Concept Breakdown

1.  **Standard Streams**:
    -   `0` (STDIN - Standard Input): Keyboard or piped input stream.
    -   `1` (STDOUT - Standard Output): Normal command output stream.
    -   `2` (STDERR - Standard Error): Error message stream.
2.  **Redirection Operators**:
    -   `>` (Overwrite STDOUT), `>>` (Append STDOUT).
    -   `2>` (Overwrite STDERR), `2>>` (Append STDERR).
    -   `&>` or `> file 2>&1` (Redirect both STDOUT and STDERR to the
        same target).
    -   `<` (Redirect file content into STDIN).
    -   `/dev/null` (The "bit bucket" / trash device---used to swallow
        unwanted output or error noise).
3.  **Pipes & Here Docs**:
    -   `cmd1 | cmd2`: Chains output of `cmd1` directly into input of
        `cmd2`.
    -   `cat << EOF ... EOF` (Here-Doc): Feeds multi-line text blocks
        directly into commands or files.
    -   `exec 3>file.txt`: Opens custom file descriptor `3` for writing
        throughout a script session.

## 📋 QUESTIONS (Beginner Challenges 11.1 -- 11.15)

### Challenge 11.1: Standard Output Redirection (`>`)

-   **Scenario**: Write a command to save the list of files in the
    current folder (`ls -l`) into a file named `directory_contents.txt`,
    overwriting any existing file content.

### Challenge 11.2: Appending Output (`>>`)

-   **Scenario**: Write a command to append the current date and time
    (`date`) to an audit log file `system_events.log` without
    overwriting previous logs.

### Challenge 11.3: Separating Errors from Output (`2>`)

-   **Scenario**: Run `ls /valid_dir /invalid_dir`. Redirect the error
    message to `error.log` while letting the standard output display on
    your terminal screen.

### Challenge 11.4: Combining STDOUT & STDERR (`&>`)

-   **Scenario**: Run a backup script command
    `tar -czvf backup.tar.gz /data` and send both stdout log messages
    and any error output into a single unified file `backup.log`.

### Challenge 11.5: Discarding Error Noise (`2> /dev/null`)

-   **Scenario**: Search for a file across the system using
    `find / -name "app.conf"` and discard all "Permission denied" error
    noise by redirecting standard error to `/dev/null`.

### Challenge 11.6: Reading File Content into STDIN (`<`)

-   **Scenario**: Count the number of lines in `access.log` using
    `wc -l` by feeding the file into `wc` via input redirection `<` so
    that the filename is NOT printed in the final output.

### Challenge 11.7: Here-Document File Creation (`cat << EOF`)

-   **Scenario**: Use a Here-Doc to generate a config file containing
    `PORT=8080` and `DB_HOST=localhost`.

### Challenge 11.8--11.15

See original content for the remaining challenges (Here-Strings, pipes,
tee, while read, file descriptors, process substitution, swapping
stdout/stderr).
