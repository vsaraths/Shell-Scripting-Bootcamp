# 🏁 Day 4: Variable Challenge Arena - Volume 2 Solution Manual

This document provides the official answers, script architectures, and
terminal output examples for challenges **16 through 35**.

------------------------------------------------------------------------

## 🟢 Level 6: User Interaction & Dynamic Echoes

### Challenge 16: The Teleporter Prompt

**Script (`teleport.sh`):**

``` bash
#!/bin/bash
echo "Where do you want to teleport today?"
read -r destination
echo "✨ Teleporting you safely to $destination... Zoom!"
```

**Expected Output:**

``` text
Where do you want to teleport today?
Mars
✨ Teleporting you safely to Mars... Zoom!
```

### Challenge 17: Secret Passcode Input

``` bash
#!/bin/bash
echo "Type your secret key:"
read -s password
echo "🔒 Password recorded safely in our variable box!"
```

### Challenge 18: Default Value Rescue

``` bash
#!/bin/bash
# user_theme="Cyberpunk"
echo "Active Theme: ${user_theme:-Dark Mode}"
```

That part trips people up — bash syntax can look like a total alphabet soup when you first see it!

Let's break down exactly what `${user_theme:-Dark Mode}` is doing. Think of it as a built-in **"safety net"** or an **"if/else" statement shrunk down into a single line.**

Here is the plain-English translation of that syntax:

> *"Hey Bash, look inside the variable `user_theme`. If it has a value, print that value. But if it's empty or doesn't exist, don't panic—just print 'Dark Mode' instead."*

## Breaking Down the Pieces

*   `${user_theme...}`: The curly braces tell Bash you are doing something special with the variable `user_theme`.
*   `:-`: This specific symbol combo means **"If empty, use the fallback text to the right."**
*   `Dark Mode`: This is your fallback (default) value.

## How to Run the Test

To see it in action, you can run these commands directly in your terminal, or put them in a script. Let's look at the two scenarios your challenge asks for:

### Test 1: Leaving it empty (The Rescue)
If we make `user_theme` completely blank, the fallback kicks in.

```bash
user_theme=""
echo "Active Theme: ${user_theme:-Dark Mode}"
```

**Output:**
```plaintext
Active Theme: Dark Mode
```

### Test 2: Giving it a value (The Normal Way)
If we actually assign something to `user_theme`, Bash ignores the fallback entirely.

```bash
user_theme="Cyberpunk"
echo "Active Theme: ${user_theme:-Dark Mode}"
```

**Output:**
```plaintext
Active Theme: Cyberpunk
```

## Why use this?

Without this shortcut, you would have to write five lines of code just to check if the variable is empty:

```bash
if [ -z "$user_theme" ]; then
    echo "Active Theme: Dark Mode"
else
    echo "Active Theme: $user_theme"
fi
```

The `${variable:-default}` syntax lets you do all of that logic instantly inside your `echo` statement.

------------------------------------------------------------------------

## 🟡 Level 7: String Length & Slicing Magic

### Challenge 19

``` bash
#!/bin/bash
secret_word="Supercalifragilisticexpialidocious"
echo "That word is exactly ${#secret_word} characters long!"
```

Expected:

``` text
That word is exactly 34 characters long!
```

# Using `if` Conditions with Bash Word Length

If you wanted to achieve the exact same result using a traditional `if` condition instead of the short `${#secret_word}` syntax, you can't do it directly because `if` statements are used for **checking conditions** (like true/false), not for performing calculations or counting.

However, you *would* use an `if` condition if you wanted to **take action based on the length** of the word.

Here are the two ways `if` conditions tie into this:

---

## 1. The Long Way (Calculating it with a tool first)

If you didn't use Bash's built-in syntax, you would have to use an external tool like `wc -m` (word count - characters) to calculate the length, store it in a variable, and then you could use an `if` condition to check it.

```bash
# Count the characters using an external command
char_count=$(echo -n "$secret_word" | wc -m)

# Use an 'if' condition to check if it's a long word
if [ "$char_count" -gt 20 ]; then
    echo "That word is exactly $char_count characters long! That is a long word!"
fi
```

---

## 2. The Smart Way (Combining both)

In the real world, you usually combine the `${#}` syntax *inside* an `if` condition to validate inputs (like checking if a password is long enough).

Here is how you write that:

```bash
secret_word="Supercalifragilisticexpialidocious"

# IF the number of characters in secret_word is greater than (-gt) 10...
if [ ${#secret_word} -gt 10 ]; then
    echo "That word is exactly ${#secret_word} characters long!"
fi
```

---

## Quick Syntax Breakdown for the `if` bracket:

*   **`[ ${#secret_word} ... ]`**: Looks at the character count (34).
*   **`-gt`**: Stands for **g**reater **t**han.
*   **`10`**: The number it is comparing against.

### Challenge 20

``` bash
#!/bin/bash
long_date="2026-07-11"
year=${long_date:0:4}
echo "The year extracted from the date is: $year"
```

### Challenge 21

``` bash
#!/bin/bash
name=$1
nickname=${name:0:3}
echo "Your gaming nickname is: ${nickname}... Go get 'em!"
```

Run:

``` bash
./nickname.sh Sarath
```

Output:

``` text
Your gaming nickname is: Sar... Go get 'em!
```

------------------------------------------------------------------------

## 🟠 Level 8

### Challenge 22

``` bash
#!/bin/bash
counter=1
while [ $counter -le 5 ]; do
  echo "High Five #$counter! 🖐️"
  ((counter++))
done
```

### Challenge 23

``` bash
#!/bin/bash
timer=10
while [ $timer -gt 0 ]; do
  echo "$timer..."
  ((timer--))
  sleep 1
done
echo "🚀 BLAST OFF!"
```

### Challenge 24

``` bash
#!/bin/bash
base=$1
multiplier=5
((product=base*multiplier))
echo "$base times $multiplier equals $product"
```

------------------------------------------------------------------------

## 🔴 Level 9

### Challenge 25

``` bash
#!/bin/bash
backup_folder="my_backups"
if [ ! -d "$backup_folder" ]; then
  echo "Directory not found. Creating $backup_folder..."
  mkdir "$backup_folder"
fi
```

### Challenge 26

``` bash
#!/bin/bash
project="website"
version=2
filename="${project}_v${version}.tar.gz"
echo "Backup target name config: $filename"
```

### Challenge 27

``` bash
#!/bin/bash
echo "--- System Binary Search Paths ---"
echo -e "${PATH//:/\n}"
```

------------------------------------------------------------------------

## ⚡ Level 10

### Challenge 28

``` bash
#!/bin/bash
mkdir /protected_folder_xyz 2>/dev/null
status=$?
if ((status!=0)); then
  echo "⚠️ Access Denied: You do not have permissions!"
fi
```

### Challenge 29

``` bash
#!/bin/bash
((choice=RANDOM%3+1))
if ((choice==1)); then
  server="prod-server-01"
elif ((choice==2)); then
  server="prod-server-02"
else
  server="prod-server-03"
fi
echo "Routing internet traffic dynamically to: $server"
```

### Challenge 30

``` bash
#!/bin/bash
disk_used=87
if ((disk_used>80)); then
  echo "🚨 WARNING: Disk utilization is critical at $disk_used%!"
fi
```

### Challenge 31

``` bash
#!/bin/bash
if (( $# == 0 )); then
  echo "❌ Error: This script requires at least 1 input argument to run!"
  exit 1
fi
echo "Processing input: $1"
```

### Challenge 32

``` bash
#!/bin/bash
skills="Linux,Docker,AWS,Ansible"
OLD_IFS=$IFS
IFS=","
for skill in $skills; do
  echo "🔧 Skill: $skill"
done
IFS=$OLD_IFS
```

### Challenge 33

``` bash
#!/bin/bash
config_line="DB_PORT=5432"
port=${config_line#*=}
echo "The database port number found is: $port"
```

### Challenge 34

``` bash
#!/bin/bash
readonly DEVOPS_ZONE="Production"
echo "Current Environment Zone: $DEVOPS_ZONE"
DEVOPS_ZONE="Staging"
```

Expected:

``` text
./lockdown.sh: line 6: DEVOPS_ZONE: readonly variable
```

### Challenge 35

``` bash
#!/bin/bash
echo "Enter your preferred deployment name:"
read -r app_name
((server_id=RANDOM%100+1))
echo "=========================================="
echo "📊 DEPLOYMENT MONITOR CORE ACTIVATED"
echo "=========================================="
echo "User Node  : $USER"
echo "Host Core  : $HOSTNAME"
echo "App Target : $app_name"
echo "Server Node: srv-${server_id}"
echo "Status     : Verification reached at Line: $LINENO"
echo "=========================================="
```
