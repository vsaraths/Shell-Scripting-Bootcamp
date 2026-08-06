Welcome to Day 13: Advanced Text Processing with AWK & SED!

sed (Stream Editor) and awk (Aho, Weinberger, and Kernighan) are two of the most indispensable tools in Linux text processing. While grep is great for finding lines, sed excels at transforming/editing text streams, and awk is a full programming language designed for field-based reporting and data extraction.

💡 Core Concept Breakdown
sed (Stream Editor):

Operates on text streams line-by-line.

Primary use cases: Substitution/Replacement (s/old/new/g), deleting lines (d), printing specific lines (p), and in-place file modification (sed -i).

Key syntax: sed 's/pattern/replacement/flags' filename

awk (Pattern Scanning and Processing Language):

Treats input files as tables made of Records (lines) and Fields (columns).

Key Built-in Variables:

$0: The entire line.

$1, $2, $3...: Field 1, Field 2, Field 3...

NF: Number of Fields on the current line.

NR: Number of Records (current line number).

FS: Field Separator (default is whitespace, can be set via -F).

OFS: Output Field Separator (default is space).

Structure: awk 'BEGIN { ... } condition { action } END { ... }' filename

📋 QUESTIONS (Beginner Challenges 13.1 – 13.15)
Challenge 13.1: Basic String Replacement with SED
Scenario: Replace the first occurrence of http:// with https:// on every line in urls.txt.

Input File (urls.txt):

Plaintext
http://example.com/api
http://service.local/health
http://http-mirror.org/test
Challenge 13.2: Global String Replacement (/g)
Scenario: Replace ALL occurrences of the word localhost with 127.0.0.1 in config.txt.

Input File (config.txt):

Plaintext
host=localhost; backup=localhost
bind=localhost
Challenge 13.3: Delete Lines Matching a Pattern (/d)
Scenario: Remove all lines starting with # (comments) from app.conf.

Input File (app.conf):

Plaintext
# System settings
port=8080
# Database settings
db_host=10.0.0.1
Challenge 13.4: Delete Specific Line Numbers
Scenario: Delete the first line (header) of data.csv.

Input File (data.csv):

Plaintext
ID,Name,Role
101,Alice,Dev
102,Bob,Ops
Challenge 13.5: Print Specific Line Ranges (-n and p)
Scenario: Print only lines 2 through 4 from deploy.log.

Input File (deploy.log):

Plaintext
Step 1: Check environment
Step 2: Pull latest container
Step 3: Run database migrations
Step 4: Restart web service
Step 5: Verify health check
Challenge 13.6: Printing Specific Columns with AWK
Scenario: Print only the username (column 1) and process status (column 3) from ps_output.txt.

Input File (ps_output.txt):

Plaintext
root 1234 RUNNING
deploy 5678 SLEEPING
nginx 9101 RUNNING
Challenge 13.7: Custom Field Separators (awk -F)
Scenario: Extract the username (field 1) and default shell (field 7) from a /etc/passwd style CSV/colon-delimited file users.csv.

Input File (users.csv):

Plaintext
root:x:0:0:root:/root:/bin/bash
appuser:x:1001:1001::/home/appuser:/bin/sh
guest:x:1002:1002::/home/guest:/bin/false
Challenge 13.8: Filtering by Column Value
Scenario: Print all lines from inventory.txt where the stock count (column 2) is less than 10.

Input File (inventory.txt):

Plaintext
Apples 15
Bananas 4
Oranges 20
Pears 2
Challenge 13.9: Using AWK Built-in Variable NR (Line Numbers)
Scenario: Print each line of tasks.txt preceded by its line number (e.g., 1: Task A).

Input File (tasks.txt):

Plaintext
Backup DB
Update packages
Rotate logs
Challenge 13.10: Using AWK Built-in Variable NF (Last Field)
Scenario: Print the last field/column of each line in audit.log, regardless of how many words/columns are in that line.

Input File (audit.log):

Plaintext
User root logged in SUCCESS
Failed login attempt from IP 192.168.1.10 FAILURE
System rebooted OK
Challenge 13.11: AWK BEGIN and END Blocks
Scenario: Print a header line "--- START OF REPORT ---", then display all records in events.txt, and end with "--- END OF REPORT ---".

Input File (events.txt):

Plaintext
Event_1: OK
Event_2: FAIL
Challenge 13.12: Summing Column Values with AWK
Scenario: Calculate and print the total memory used (sum of column 2) from mem_usage.txt.

Input File (mem_usage.txt):

Plaintext
web_server 512
db_server 2048
cache_server 1024
Challenge 13.13: SED In-Place File Editing (sed -i)
Scenario: Replace DEBUG=true with DEBUG=false directly inside the file settings.env (modify the file directly, do not just print to terminal).

Input File (settings.env):

Plaintext
PORT=8080
DEBUG=true
ENV=production
Challenge 13.14: SED Case-Insensitive Matching (/I)
Scenario: Replace error with SUCCESS regardless of capitalization (error, ERROR, Error) using SED.

Input File (status.txt):

Plaintext
Status: error occurred
Status: ERROR logged
Status: Error resolved
Challenge 13.15: Combining AWK Conditional Matching and Formatting
Scenario: Print "USER: <username> STATUS: ACTIVE" for all users in account.txt whose status (column 2) equals active.

Input File (account.txt):

Plaintext
alice active
bob inactive
charlie active
💡 ANSWERS & EXPLANATIONS
Answer 13.1: Basic String Replacement with SED
Bash
#!/bin/bash
sed 's/http:\/\//https:\/\//' urls.txt
# Alternatively, using a different delimiter to avoid escaping slashes:
sed 's|http://|https://|' urls.txt
Everyday Analogy: Search-and-replace in a text editor for the first instance on each line.

Line Breakdown:

s: Substitute command.

|http://|https://|: Replaces http:// with https://. Using | as a delimiter avoids needing to escape / as \/.

Answer 13.2: Global String Replacement (/g)
Bash
#!/bin/bash
sed 's/localhost/127.0.0.1/g' config.txt
Everyday Analogy: Clicking "Replace All" in a word processor across every line.

Line Breakdown:

/g: global flag ensures every occurrence on the line is replaced, not just the first one.

Answer 13.3: Delete Lines Matching a Pattern (/d)
Bash
#!/bin/bash
sed '/^#/d' app.conf
Everyday Analogy: Skimming a document with a black marker and redacting/deleting every line starting with #.

Line Breakdown:

/^#/: Matches lines that start with #.

d: delete command.

Answer 13.4: Delete Specific Line Numbers
Bash
#!/bin/bash
sed '1d' data.csv
Everyday Analogy: Tearing off the top cover page/header row of a printed sheet.

Line Breakdown:

1: Specifies line number 1.

d: delete command.

Answer 13.5: Print Specific Line Ranges (-n and p)
Bash
#!/bin/bash
sed -n '2,4p' deploy.log
Everyday Analogy: Printing only pages 2 through 4 from a document printer queue.

Line Breakdown:

-n: Suppresses automatic printing of all lines.

2,4p: prints lines 2 through 4.

Answer 13.6: Printing Specific Columns with AWK
Bash
#!/bin/bash
awk '{print $1, $3}' ps_output.txt
Everyday Analogy: Looking at a multi-column table and reading out only Column 1 and Column 3.

Line Breakdown:

$1: First field/column.

$3: Third field/column.

,: Adds default output field separator (a space) between fields.

Answer 13.7: Custom Field Separators (awk -F)
Bash
#!/bin/bash
awk -F':' '{print $1, $7}' users.csv
Everyday Analogy: Splitting a CSV sheet by colon delimiter rather than spaces.

Line Breakdown:

-F':': Sets Field Separator to colon : character.

$1, $7: Prints 1st and 7th colon-separated fields.

Answer 13.8: Filtering by Column Value
Bash
#!/bin/bash
awk '$2 < 10' inventory.txt
Everyday Analogy: Filtering a grocery inventory spreadsheet to highlight items with stock numbers below 10.

Line Breakdown:

$2 < 10: Condition checking if value in second field is less than 10. If true, prints default $0 (the entire line).

Answer 13.9: Using AWK Built-in Variable NR (Line Numbers)
Bash
#!/bin/bash
awk '{print NR ":" $0}' tasks.txt
Everyday Analogy: Adding a numbered list prefix (1., 2., 3.) next to items in a task list.

Line Breakdown:

NR: Number of Record (current line number).

$0: Represents the entire current line.

Answer 13.10: Using AWK Built-in Variable NF (Last Field)
Bash
#!/bin/bash
awk '{print $NF}' audit.log
Everyday Analogy: Reading only the final word at the end of every sentence.

Line Breakdown:

NF: Number of Fields (total count of columns in current line).

$NF: Evaluates to the content of the last field (e.g., if line has 5 fields, $NF becomes $5).

Answer 13.11: AWK BEGIN and END Blocks
Bash
#!/bin/bash
awk 'BEGIN {print "--- START OF REPORT ---"} {print $0} END {print "--- END OF REPORT ---"}' events.txt
Everyday Analogy: Printing a document header before processing data rows and a document footer after all rows are processed.

Line Breakdown:

BEGIN { ... }: Executes once before reading input file.

{print $0}: Executes for every line in file.

END { ... }: Executes once after all input lines are processed.

Answer 13.12: Summing Column Values with AWK
Bash
#!/bin/bash
awk '{sum += $2} END {print "Total Memory:", sum}' mem_usage.txt
Everyday Analogy: Adding up a column of prices at the bottom of a receipt.

Line Breakdown:

{sum += $2}: Accumulates value of column 2 into variable sum for each line.

END {print ...}: Displays final accumulated total after reading file.

Answer 13.13: SED In-Place File Editing (sed -i)
Bash
#!/bin/bash
sed -i 's/DEBUG=true/DEBUG=false/' settings.env
Everyday Analogy: Opening a document, making a edit, and hitting Ctrl+S (Save) to overwrite the file directly.

Line Breakdown:

-i: in-place edit flag (modifies file on disk rather than sending output to terminal).

Answer 13.14: SED Case-Insensitive Matching (/I)
Bash
#!/bin/bash
sed 's/error/SUCCESS/gI' status.txt
Everyday Analogy: Turning on "Match Case = Off" when doing global search and replace in a text editor.

Line Breakdown:

g: Global flag (all matches on line).

I: Case-Insensitive matching flag in GNU sed.

Answer 13.15: Combining AWK Conditional Matching and Formatting
Bash
#!/bin/bash
awk '$2 == "active" {print "USER:", $1, "STATUS:", "ACTIVE"}' account.txt
Everyday Analogy: Filtering an employee directory for "Active" status and reformatting their names into a custom badge label format.

Line Breakdown:

$2 == "active": Checks if second field equals string "active".

{print ...}: Formats and outputs custom text string.