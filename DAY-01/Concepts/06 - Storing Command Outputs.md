# 📥 Storing Command Outputs in Bash

> **Module:** Day-01 Concepts  
> **Lesson:** 06 - Storing Command Outputs  
> **Difficulty:** 🟢 Beginner

---

# 🎯 What You'll Learn

After completing this lesson, you'll be able to:

- Understand command substitution
- Store command outputs in variables
- Use the modern `$(command)` syntax
- Understand the older backtick syntax
- Learn how Bash captures command output internally
- Apply command substitution in real-world DevOps automation

---

# 🤔 Why Do We Need Command Substitution?

Imagine you're writing a backup script.

Every backup file should contain today's date.

Without storing the command output, you'd have to manually type the date every day.

```
backup-2026-08-06.tar.gz
backup-2026-08-07.tar.gz
backup-2026-08-08.tar.gz
```

Instead, Bash can execute the `date` command, capture its output, and store it inside a variable automatically.

That's exactly what **command substitution** does.

---

# 📖 What is Command Substitution?

Command substitution means:

> Execute a command and store its output inside a variable.

Instead of writing a value yourself, Bash runs another command and saves the result.

Example:

```bash
today=$(date)

echo "$today"
```

Possible Output:

```text
Thu Aug 6 11:45:32 IST 2026
```

Here,

- `date` runs
- Bash captures its output
- The output is assigned to the variable `today`

---

# 🌍 Real-World DevOps Scenario

Suppose you want to create backup files like:

```
backup-2026-08-06.tar.gz
```

Instead of manually changing the filename every day:

```bash
backup-2026-08-05.tar.gz
```

You can write:

```bash
DATE=$(date +%F)

tar -czf backup-$DATE.tar.gz /var/www
```

Now the filename changes automatically every day.

---

# ⚙️ Behind the Scenes

When Bash sees:

```bash
current_date=$(date)
```

it does **not** simply copy the command.

It performs several steps.

```
Script Starts
      │
      ▼
Bash finds $(date)
      │
      ▼
Creates a Child Process
      │
      ▼
Executes "date"
      │
      ▼
Captures Standard Output
      │
      ▼
Removes Trailing Newline
      │
      ▼
Stores Result in Variable
      │
      ▼
Continues Script
```

This process is called **command substitution**.

---

# 📊 Visual Diagram

```
+----------------------+
| Bash Script          |
+----------+-----------+
           |
           v
current=$(date)
           |
           v
+----------------------+
| Execute date command |
+----------+-----------+
           |
           v
+----------------------+
| Output               |
| Thu Aug 6 ...        |
+----------+-----------+
           |
           v
+----------------------+
| Save into Variable   |
| current              |
+----------------------+
```

---

# 💻 Example 1 – Current Date

```bash
#!/bin/bash

today=$(date)

echo "Today is $today"
```

Output:

```
Today is Thu Aug 6 11:45:32 IST 2026
```

---

# 💻 Example 2 – Current User

```bash
current_user=$(whoami)

echo "Logged in as $current_user"
```

Output:

```
Logged in as sarath
```

---

# 💻 Example 3 – Current Directory

```bash
directory=$(pwd)

echo "Current Directory: $directory"
```

Output:

```
Current Directory: /home/sarath/projects
```

---

# 🚀 DevOps Example – Kubernetes

Count the number of running pods.

```bash
pod_count=$(kubectl get pods --no-headers | wc -l)

echo "Running Pods: $pod_count"
```

Instead of manually counting them, the script does it automatically.

---

# 🚀 DevOps Example – Docker

```bash
container_count=$(docker ps -q | wc -l)

echo "Running Containers: $container_count"
```

This is commonly used in monitoring scripts.

---

# 🚀 DevOps Example – AWS CLI

```bash
account=$(aws sts get-caller-identity \
--query Account \
--output text)

echo "AWS Account ID: $account"
```

This helps verify which AWS account the script is using before performing operations.

---

# 📖 Using `$(...)` vs Backticks

Older Bash scripts often use backticks.

Example:

```bash
today=`date`
```

This works, but it's harder to read and becomes confusing when commands are nested.

Modern syntax:

```bash
today=$(date)
```

This is easier to read and is the recommended approach.

---

# 📊 Comparison

| `$(command)` | `` `command` `` |
|---------------|----------------|
| Modern | Legacy |
| Easy to read | Harder to read |
| Easy to nest | Difficult to nest |
| Recommended | Avoid in new scripts |

---

# 💻 Nested Command Example

Modern syntax:

```bash
current_dir=$(basename "$(pwd)")
```

This is readable because the nested command is clearly visible.

The equivalent using backticks is much harder to understand and is generally discouraged.

---

# ⚠️ Common Mistakes

### ❌ Forgetting `$()`

Wrong:

```bash
today=date
```

This stores the literal word `date`, not the command output.

---

### ❌ Adding Spaces Around `=`

Wrong:

```bash
today = $(date)
```

Bash treats this as a command and reports an error.

Correct:

```bash
today=$(date)
```

---

### ❌ Using `echo` for Parsing

Some beginners write:

```bash
files=$(echo *.txt)
```

Prefer using shell features directly unless you specifically need `echo`.

---

### ❌ Using Backticks in New Scripts

Avoid:

```bash
today=`date`
```

Prefer:

```bash
today=$(date)
```

---

# ✅ Best Practices

✔ Always use `$(...)` instead of backticks.

✔ Give variables meaningful names.

Good:

```bash
current_date
```

Better than:

```bash
d
```

✔ Quote variable expansions.

```bash
echo "$current_date"
```

✔ Capture only the output you actually need.

---

# 🧪 Practice Exercise

Create a script named:

```text
server_info.sh
```

The script should store and display:

- Current Date
- Current User
- Current Directory
- Hostname
- Number of logged-in users

Expected output:

```
Current Date : Thu Aug 6

Current User : sarath

Directory : /home/sarath

Hostname : dev-server

Logged-in Users : 3
```

---

# 💡 DevOps Tip

> [!TIP]
> Command substitution is everywhere in DevOps. You'll frequently capture outputs from commands like `kubectl`, `docker`, `aws`, `terraform`, `git`, and `systemctl` to make decisions or generate dynamic configuration. Mastering `$(...)` is a key step toward writing powerful automation scripts.

---

# 📚 Summary

In this lesson, you learned:

- What command substitution is
- How to store command outputs in variables
- Why `$(...)` is preferred
- The difference between modern and legacy syntax
- How Bash captures command output internally
- Real-world DevOps use cases

---

# ⏭️ Next Lesson

➡️ **07 - Basic String Operations**

In the next lesson, you'll learn:

- String concatenation
- Finding string length
- Converting to uppercase and lowercase
- Extracting substrings
- Replacing text
- Checking empty strings
- Comparing strings
- Practical DevOps examples for manipulating filenames, image tags, and environment names

Happy scripting! 🚀
