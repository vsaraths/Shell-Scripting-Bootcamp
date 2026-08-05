# 🔀 If Statements in Bash

> **Module:** Day-01 Concepts  
> **Lesson:** 09 - If Statements  
> **Difficulty:** 🟡 Beginner → Intermediate  
> **Prerequisites:** Variables, Functions

---

# 🎯 What You'll Learn

After completing this lesson, you'll understand:

- What an `if` statement is
- Why decision-making is important in Bash
- Bash exit status (0 vs non-zero)
- Different test expressions
- Numeric comparisons
- String comparisons
- File and directory tests
- Logical operators
- Nested `if` statements
- Real-world DevOps examples
- Mini Project

---

# 🤔 Why Do We Need If Statements?

Imagine you're a DevOps Engineer responsible for deploying applications.

Before every deployment, you must verify:

- Is Docker installed?
- Is Kubernetes reachable?
- Is there enough disk space?
- Is the service already running?
- Is the configuration file present?

Without decision-making, your script blindly executes commands—even when something is wrong.

That can cause deployment failures, downtime, or data loss.

Instead, your script should think before it acts.

That's exactly what the `if` statement allows you to do.

---

# 📖 What is an If Statement?

An `if` statement allows a script to execute code **only if a condition is true**.

Think of it like asking a question.

```
Is Docker Installed?

        │

        ▼

     Yes / No

        │

        ▼

Take Action
```

The script first evaluates a condition.

If it's true, the commands inside the `if` block run.

If it's false, Bash skips that block.

---

# 🌍 Real-World Analogy

Imagine you're entering an office building.

```
Do you have an ID card?

        │

   ┌────┴────┐

  Yes       No

   │         │

Enter      Access Denied
```

This is exactly how an `if` statement works.

---

# ⚙️ How Bash Evaluates an If Statement

```
Script Starts
      │
      ▼
Evaluate Condition
      │
      ▼
Exit Status?
      │
 ┌────┴────┐
 │         │
0       Non-zero
 │         │
 ▼         ▼
Execute   Skip Block
```

Notice something important.

Bash doesn't evaluate **True** or **False** directly.

It evaluates the **exit status** of a command.

---

# 🧠 Understanding Exit Status

Every command in Linux returns an exit status.

```
0

↓

Success
```

Any other value means something went wrong.

Example:

```bash
mkdir demo
```

If the directory is created successfully:

```
Exit Status = 0
```

If the directory already exists:

```
Exit Status = 1
```

You can view the exit status using:

```bash
echo $?
```

Example:

```bash
mkdir project

echo $?
```

Output:

```
0
```

---

# 📝 Basic If Statement

Syntax:

```bash
if [ condition ]
then
    commands
fi
```

---

# 💻 Example 1

```bash
#!/bin/bash

age=20

if [ "$age" -ge 18 ]
then
    echo "Adult"
fi
```

Output:

```
Adult
```

---

# 📊 Visual Flow

```
        age=20
           │
           ▼
    Is age >= 18 ?
           │
      ┌────┴────┐
      │         │
     Yes       No
      │         │
      ▼         ▼
 Print Adult   Skip
```

---

# 🔢 Numeric Comparison Operators

| Operator | Meaning |
|----------|---------|
| `-eq` | Equal |
| `-ne` | Not Equal |
| `-gt` | Greater Than |
| `-lt` | Less Than |
| `-ge` | Greater Than or Equal |
| `-le` | Less Than or Equal |

Example:

```bash
marks=85

if [ "$marks" -gt 50 ]
then
    echo "Passed"
fi
```

---

# 🔤 String Comparisons

```bash
env="production"

if [[ "$env" == "production" ]]
then
    echo "Deploying..."
fi
```

Output:

```
Deploying...
```

For Bash scripts, prefer `[[ ... ]]` for string comparisons because it handles quoting and pattern matching more safely than `[ ... ]`.

---

# 📁 File Tests

Check if a file exists:

```bash
if [ -f backup.sh ]
then
    echo "Backup Script Found"
fi
```

---

Check if a directory exists:

```bash
if [ -d logs ]
then
    echo "Logs Directory Exists"
fi
```

---

Check if a file is executable:

```bash
if [ -x deploy.sh ]
then
    echo "Executable"
fi
```

---

# 📋 Common File Test Operators

| Operator | Description |
|----------|-------------|
| `-f` | Regular file exists |
| `-d` | Directory exists |
| `-e` | File or directory exists |
| `-r` | Readable |
| `-w` | Writable |
| `-x` | Executable |
| `-s` | File exists and is not empty |

---

# 🔗 Logical Operators

Sometimes you need more than one condition.

Using `[[ ... ]]`:

```bash
if [[ "$user" == "admin" && "$env" == "production" ]]
then
    echo "Deployment Allowed"
fi
```

OR:

```bash
if [[ "$env" == "dev" || "$env" == "test" ]]
then
    echo "Safe Environment"
fi
```

---

# 🚀 DevOps Example – Check Docker

```bash
if command -v docker >/dev/null 2>&1
then
    echo "Docker Installed"
fi
```

Why this works:

- `command -v docker` checks if the `docker` command exists.
- If found, it returns exit status `0`.
- The `if` statement executes the success block.

---

# 🚀 DevOps Example – Check Kubernetes Cluster

```bash
if kubectl cluster-info >/dev/null 2>&1
then
    echo "Cluster Reachable"
fi
```

This verifies that your Kubernetes cluster is accessible before deploying.

---

# 🚀 DevOps Example – Check Disk Usage

```bash
usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$usage" -gt 80 ]
then
    echo "Warning: Disk usage is above 80%"
fi
```

This is a common monitoring pattern.

---

# 🚀 DevOps Example – Verify Configuration File

```bash
if [ -f config.yaml ]
then
    echo "Configuration Found"
fi
```

Many deployment scripts stop immediately if a required configuration file is missing.

---

# ⚠️ Common Mistakes

### ❌ Forgetting Spaces

Wrong:

```bash
if["$age" -gt 18]
```

Correct:

```bash
if [ "$age" -gt 18 ]
```

Spaces are required around `[` and `]`.

---

### ❌ Forgetting `fi`

Every `if` block must end with:

```bash
fi
```

---

### ❌ Using `=` for Numbers

Wrong:

```bash
[ "$age" = 20 ]
```

For numeric comparisons, use:

```bash
[ "$age" -eq 20 ]
```

---

### ❌ Forgetting Quotes

Wrong:

```bash
[ $name = Sarath ]
```

Preferred:

```bash
[ "$name" = "Sarath" ]
```

---

# ✅ Best Practices

✔ Prefer `[[ ... ]]` for string comparisons.

✔ Quote variable expansions.

✔ Keep conditions readable.

✔ Handle failures gracefully.

✔ Check required files before using them.

✔ Validate prerequisites before deployments.

---

# 🧪 Mini Project

Create a script named:

```text
pre_deployment_check.sh
```

The script should verify:

- Docker is installed.
- Kubectl is installed.
- A `deployment.yaml` file exists.
- The current directory is writable.

If every check passes:

```
All pre-deployment checks passed.
Ready to deploy.
```

Otherwise, print a meaningful error and exit with a non-zero status.

---

# 💡 DevOps Tip

> [!TIP]
> Every production deployment should validate its environment before making changes. Simple `if` checks can prevent failed releases, corrupted deployments, and accidental downtime. A few extra lines of validation often save hours of troubleshooting.

---

# 📚 Summary

In this lesson, you learned:

- What an `if` statement is
- How Bash evaluates conditions
- Exit status
- Numeric comparisons
- String comparisons
- File tests
- Logical operators
- Practical DevOps examples
- Best practices

---

# ⏭️ Next Lesson

➡️ **10 - If, Else, and Elif Statements**

You'll learn how to:

- Execute different actions based on multiple conditions
- Build decision trees
- Handle environment selection (dev, staging, production)
- Write cleaner and more maintainable Bash scripts

Happy scripting! 🚀
