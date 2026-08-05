# 🎯 Case Statements in Bash

> **Module:** Day-01 Concepts  
> **Lesson:** 12 - Case Statements
> **Difficulty:** 🟡 Beginner → Intermediate
> **Prerequisites:** If Statements, Variables, User Input

---

# 🎯 What You'll Learn

After completing this lesson, you'll understand:

- What a `case` statement is
- Why `case` is useful
- Basic syntax
- Pattern matching
- Wildcards
- Multiple patterns
- Real-world DevOps examples
- Best practices
- Mini Project

---

# 🤔 Why Do We Need Case Statements?

Imagine you're writing a DevOps utility.

When the script starts, it asks:

```
=========================

DevOps Utility

=========================

1. Check Disk

2. Check Memory

3. Check Docker

4. Check Kubernetes

5. Exit
```

Depending on the user's choice, the script performs a different task.

You *could* implement this using many `if`, `elif`, and `else` statements.

However, when there are many choices, the code becomes longer and harder to read.

A `case` statement keeps the code organized and easy to maintain.

---

# 📖 What is a Case Statement?

A `case` statement compares one value against multiple patterns.

As soon as a matching pattern is found, Bash executes the corresponding commands and exits the `case` block.

Think of it like selecting an option from a menu.

```
User Choice

      │

      ▼

+-------------------+

|       case        |

+-------------------+

 │

 ├──────► Option 1

 ├──────► Option 2

 ├──────► Option 3

 └──────► Default
```

Only one matching branch is executed.

---

# ⚙️ Syntax

```bash
case expression in

    pattern1)
        commands
        ;;

    pattern2)
        commands
        ;;

    *)
        default commands
        ;;

esac
```

Notice the keywords:

```
case

↓

in

↓

patterns

↓

;;

↓

esac
```

The word **`esac`** is simply **`case` spelled backwards**, marking the end of the statement.

---

# ⚙️ How Bash Processes a Case Statement

```
Start
   │
   ▼
Read Expression
   │
   ▼
Compare with Pattern 1
   │
   ├────────► Match?
   │
   ▼
Compare Pattern 2
   │
   ├────────► Match?
   │
   ▼
...
   │
   ▼
Default (*)
```

Once a pattern matches, Bash executes its commands and leaves the `case` statement.

---

# 💻 Example 1 – Simple Menu

```bash
#!/bin/bash

read -p "Enter your choice (1-3): " choice

case "$choice" in

    1)
        echo "Checking Disk..."
        ;;

    2)
        echo "Checking Memory..."
        ;;

    3)
        echo "Checking CPU..."
        ;;

    *)
        echo "Invalid Choice"
        ;;

esac
```

Example:

Input:

```
2
```

Output:

```
Checking Memory...
```

---

# 💻 Example 2 – Environment Selection

```bash
read -p "Environment: " env

case "$env" in

    dev)
        echo "Deploying to Development"
        ;;

    staging)
        echo "Deploying to Staging"
        ;;

    production)
        echo "Deploying to Production"
        ;;

    *)
        echo "Unknown Environment"
        ;;

esac
```

---

# 🎨 Pattern Matching

One of the biggest advantages of `case` is pattern matching.

### Match Any Character

```bash
case "$answer" in

    y)
        echo "Yes"
        ;;

    n)
        echo "No"
        ;;

esac
```

---

### Match Multiple Patterns

```bash
case "$answer" in

    y|Y)
        echo "Accepted"
        ;;

    n|N)
        echo "Rejected"
        ;;

esac
```

Input:

```
Y
```

Output:

```
Accepted
```

---

### Using Wildcards

Match everything beginning with **prod**.

```bash
case "$env" in

    prod*)
        echo "Production Environment"
        ;;

esac
```

Matches:

```
prod

production

prod-us

prod-ap
```

---

### Match File Extensions

```bash
file="backup.tar.gz"

case "$file" in

    *.gz)
        echo "Compressed File"
        ;;

    *.txt)
        echo "Text File"
        ;;

    *)
        echo "Unknown File Type"
        ;;

esac
```

---

# 🚀 DevOps Example – Docker Actions

```bash
read -p "Action (start/stop/restart): " action

case "$action" in

    start)
        docker start my-container
        ;;

    stop)
        docker stop my-container
        ;;

    restart)
        docker restart my-container
        ;;

    *)
        echo "Unknown Action"
        ;;

esac
```

---

# 🚀 DevOps Example – Kubernetes Namespace

```bash
read -p "Namespace: " ns

case "$ns" in

    dev)
        kubectl get pods -n dev
        ;;

    test)
        kubectl get pods -n test
        ;;

    production)
        kubectl get pods -n production
        ;;

    *)
        echo "Namespace Not Found"
        ;;

esac
```

---

# 🚀 DevOps Example – Linux Service Manager

```bash
read -p "Choose Action: " action

case "$action" in

    status)
        systemctl status nginx
        ;;

    start)
        systemctl start nginx
        ;;

    stop)
        systemctl stop nginx
        ;;

    restart)
        systemctl restart nginx
        ;;

    *)
        echo "Invalid Option"
        ;;

esac
```

---

# 📊 If vs Case

| If Statement | Case Statement |
|--------------|----------------|
| Best for evaluating conditions | Best for matching one value against many options |
| Can become long with many branches | Cleaner for menus and command selection |
| Good for ranges and complex logic | Good for fixed choices and patterns |

A good rule of thumb:

- Use `if` when evaluating **conditions** (for example, checking file existence or numeric comparisons).
- Use `case` when choosing between **known options**.

---

# ⚠️ Common Mistakes

### ❌ Forgetting `;;`

Wrong:

```bash
1)
    echo "Disk"
```

Correct:

```bash
1)
    echo "Disk"
    ;;
```

`;;` tells Bash that the current pattern has finished.

---

### ❌ Forgetting Quotes

Prefer:

```bash
case "$choice" in
```

instead of

```bash
case $choice in
```

Quoting protects values containing spaces or special characters.

---

### ❌ Forgetting the Default Case

Always include:

```bash
*)
```

This handles unexpected input gracefully.

---

# ✅ Best Practices

✔ Always provide a default (`*`) case.

✔ Use meaningful menu options.

✔ Keep each branch focused on a single task.

✔ Use functions inside `case` branches for larger scripts.

✔ Quote the expression being matched.

---

# 🧪 Mini Project

Create a script named:

```text
devops_toolkit.sh
```

Display the following menu:

```
==========================

DevOps Toolkit

==========================

1. Disk Usage

2. Memory Usage

3. Running Processes

4. Docker Containers

5. Kubernetes Pods

6. Exit
```

Requirements:

- Read the user's choice.
- Use a `case` statement.
- Execute the appropriate command.
- Display an error for invalid choices.

---

# 🎯 Challenge

Improve the toolkit by:

- Creating separate functions for each menu option.
- Running the menu repeatedly until the user selects **Exit**.
- Adding a confirmation before exiting.

Hint:

Combine:

- `while`
- `case`
- Functions

This brings together almost everything you've learned in Day 01.

---

# 💡 DevOps Tip

> [!TIP]
> Interactive command-line utilities often use `case` statements to implement menus and command dispatch. Whether you're building a deployment helper, server management tool, or troubleshooting utility, `case` helps keep the code organized and easier to extend.

---

# 📚 Summary

In this lesson, you learned:

- What a `case` statement is
- Basic syntax
- Pattern matching
- Wildcards
- Multiple patterns
- DevOps examples
- Best practices
- How `case` compares to `if`

---

# 🎉 Congratulations!

You have completed **Day 01 – Bash Fundamentals**.

You now understand:

- ✅ Executable scripts
- ✅ Shebang
- ✅ Reserved keywords
- ✅ Environment variables
- ✅ User input
- ✅ Command substitution
- ✅ String operations
- ✅ Functions
- ✅ If statements
- ✅ If / Else / Elif
- ✅ Loops
- ✅ Case statements

These concepts form the foundation for writing Bash scripts used in Linux administration, DevOps, CI/CD pipelines, cloud automation, and infrastructure management.

---

# ⏭️ What's Next?

**Day 02 – Intermediate Bash Scripting**

Topics may include:

- Arrays
- Arithmetic Operations
- Command-line Arguments (`$1`, `$2`, `$@`)
- Exit Codes
- File Operations
- Logging
- Error Handling
- `getopts`
- Cron Jobs
- Shell Script Project

Happy scripting! 🚀
