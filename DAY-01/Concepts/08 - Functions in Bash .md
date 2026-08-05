# 🧩 Functions in Bash

> **Module:** Day-01 Concepts  
> **Lesson:** 08 - Functions in Bash  
> **Difficulty:** 🟡 Beginner → Intermediate  
> **Prerequisites:** Variables, Command Substitution, String Operations

---

# 🎯 What You'll Learn

After completing this lesson, you'll understand:

- What functions are
- Why functions are important
- How to define and call functions
- Passing arguments to functions
- Return values vs Exit Status
- Variable scope
- Best practices
- Real-world DevOps examples
- Mini Project

---

# 🤔 Why Do We Need Functions?

Imagine you've written a deployment script.

```
Deploy Application

↓

Check Disk

↓

Check Memory

↓

Check Kubernetes Pods

↓

Check Docker Containers

↓

Deploy
```

Now imagine the script is **500 lines long**.

Every time you need to check disk usage, you copy the same code.

```bash
df -h
```

Again.

Again.

Again.

After a few weeks, your script looks like this.

```
500 Lines

↓

Repeated Code

↓

Hard to Read

↓

Hard to Maintain

↓

Hard to Debug
```

This is exactly why **functions** exist.

A function lets you write a piece of code **once** and reuse it whenever you need it.

---

# 📖 What is a Function?

A function is a **named block of reusable code**.

Instead of writing the same commands multiple times, you define them once and call the function whenever needed.

Think of a function as a machine.

```
Input

↓

Function

↓

Output
```

Whenever you need the same task again, you simply reuse the machine.

---

# 🌍 Real-World Analogy

Imagine you're working in a coffee shop.

Whenever a customer orders coffee, the barista follows the same steps:

```
Take Cup

↓

Add Coffee

↓

Add Water

↓

Serve
```

Instead of explaining these steps every time, you create a **Coffee Function**.

```
makeCoffee()

↓

Coffee Ready
```

Programming works exactly the same way.

---

# ⚙️ How Bash Executes a Function

```
Script Starts
      │
      ▼
Function Definition Found
      │
      ▼
Stored in Memory
      │
      ▼
Function Called
      │
      ▼
Execute Function
      │
      ▼
Return to Main Script
```

Notice something important.

A function **does not execute when Bash reads it**.

It executes **only when it is called**.

---

# 📊 Visual Diagram

```
+-----------------------+
| Function Definition   |
+-----------+-----------+
            |
            |
      (Stored by Bash)
            |
            v
+-----------------------+
| Function Call         |
+-----------+-----------+
            |
            v
+-----------------------+
| Execute Code          |
+-----------------------+
```

---

# 💻 Defining Your First Function

There are two common ways.

### Method 1 (Recommended)

```bash
greet() {
    echo "Hello DevOps!"
}
```

Call it.

```bash
greet
```

Output

```
Hello DevOps!
```

---

### Method 2

```bash
function greet {
    echo "Hello DevOps!"
}
```

Both methods work.

The first style is more common and follows POSIX-compatible shell syntax (when `function` is omitted).

---

# 📖 Understanding the Syntax

```
greet() {
    echo "Hello"
}
```

Breakdown:

| Part | Meaning |
|------|----------|
| greet | Function name |
| () | Indicates a function |
| { } | Function body |

---

# 💻 Calling a Function Multiple Times

```bash
greet() {
    echo "Hello DevOps!"
}

greet

greet

greet
```

Output

```
Hello DevOps!

Hello DevOps!

Hello DevOps!
```

The code is written once but executed three times.

---

# 📦 Passing Arguments

Functions can accept arguments.

Example:

```bash
greet() {
    echo "Hello $1"
}

greet Sarath
```

Output

```
Hello Sarath
```

Here,

```
$1

↓

Sarath
```

---

Multiple arguments.

```bash
userInfo() {

    echo "User : $1"

    echo "Role : $2"

}

userInfo Sarath DevOps
```

Output

```
User : Sarath

Role : DevOps
```

---

# 📊 Function Arguments

```
greet Sarath

      │

      ▼

Function

      │

$1 = Sarath
```

---

# 📌 Special Parameter Variables

Inside a function (and scripts), Bash provides positional parameters:

| Variable | Meaning |
|----------|----------|
| `$1` | First argument |
| `$2` | Second argument |
| `$3` | Third argument |
| `$#` | Number of arguments |
| `$@` | All arguments as separate words |
| `$*` | All arguments as a single word (depends on quoting) |

Example:

```bash
showArgs() {

    echo "Total Arguments : $#"

    echo "Arguments : $@"

}

showArgs Docker Kubernetes Jenkins
```

Output

```
Total Arguments : 3

Arguments : Docker Kubernetes Jenkins
```

---

# 🔄 Return Values vs Exit Status

This is one of the biggest beginner misconceptions.

Many think:

```
return

↓

Returns Text
```

Not true.

In Bash,

```
return

↓

Returns Exit Status
```

Example:

```bash
checkDisk() {

    return 0

}
```

Meaning

```
0

↓

Success
```

Non-zero values indicate different kinds of failures.

If you want to "return" text, print it and capture it:

```bash
getDate() {
    date +%F
}

today=$(getDate)

echo "$today"
```

---

# 🌍 Variable Scope

Variables are **global by default**.

```bash
name="Sarath"

showName() {

    echo "$name"

}

showName
```

Output

```
Sarath
```

To limit a variable to a function, use `local`:

```bash
showMessage() {

    local message="Deployment Started"

    echo "$message"

}
```

`message` exists only while the function runs.

---

# 🚀 DevOps Example – Check Disk Usage

```bash
checkDisk() {

    echo "Checking Disk Usage..."

    df -h

}

checkDisk
```

Instead of repeating `df -h` throughout your script, you call the function whenever needed.

---

# 🚀 DevOps Example – Kubernetes Health Check

```bash
checkPods() {

    kubectl get pods

}

checkNodes() {

    kubectl get nodes

}

checkPods

checkNodes
```

Each function has one responsibility, making the script easier to read and maintain.

---

# 🚀 DevOps Example – Logging Function

```bash
logInfo() {

    echo "[INFO] $(date '+%H:%M:%S') - $1"

}

logInfo "Deployment Started"

logInfo "Running Database Migration"

logInfo "Deployment Completed"
```

Output

```
[INFO] 10:45:22 - Deployment Started

[INFO] 10:45:30 - Running Database Migration

[INFO] 10:46:05 - Deployment Completed
```

This pattern is widely used in production scripts.

---

# ⚠️ Common Mistakes

### ❌ Forgetting to Call the Function

Defining a function does not execute it.

Wrong:

```bash
greet() {

    echo "Hello"

}
```

Nothing happens until you call:

```bash
greet
```

---

### ❌ Using Spaces in Function Names

Wrong:

```bash
my function() {

}
```

Correct:

```bash
myFunction() {

}
```

or

```bash
my_function() {

}
```

---

### ❌ Expecting `return` to Return Text

Wrong:

```bash
return "Hello"
```

`return` only sets the function's exit status (0–255).

---

### ❌ Overusing Global Variables

Prefer:

```bash
local status="Running"
```

instead of creating unnecessary global variables.

---

# ✅ Best Practices

✔ One function should perform **one task**.

✔ Use descriptive names.

Good:

```bash
checkDockerContainers()
```

Better than:

```bash
test()
```

✔ Keep functions small.

✔ Pass values as arguments instead of relying heavily on global variables.

✔ Use `local` variables whenever appropriate.

---

# 🧪 Mini Project

Create a script named:

```text
server_health.sh
```

Create the following functions:

```
checkDisk()

checkMemory()

checkCPU()

checkHostname()

checkUptime()
```

Call each function from a `main()` function.

Expected output:

```
========================

Server Health Report

========================

Hostname

Disk Usage

Memory Usage

CPU Usage

Uptime
```

---

# 💡 DevOps Tip

> [!TIP]
> Production Bash scripts rarely consist of one long sequence of commands. They are typically divided into small, reusable functions such as `deploy()`, `rollback()`, `healthCheck()`, `backup()`, and `cleanup()`. This structure improves readability, testing, and long-term maintenance.

---

# 📚 Summary

In this lesson, you learned:

- What functions are
- How to define and call them
- Passing arguments
- Special parameter variables
- Exit status vs returning output
- Local variables
- Best practices
- Real DevOps use cases

---

# ⏭️ Next Lesson

➡️ **09 - If Statements**

You'll learn:

- Boolean logic in Bash
- Test expressions
- Numeric comparisons
- String comparisons
- File tests
- Exit statuses
- Real-world DevOps decision-making scripts

Happy scripting! 🚀
