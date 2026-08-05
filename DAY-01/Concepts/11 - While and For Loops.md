# 🔁 While and For Loops in Bash

> **Module:** Day-01 Concepts  
> **Lesson:** 11 - While and For Loops
> **Difficulty:** 🟡 Beginner → Intermediate
> **Prerequisites:** Variables, Functions, If Statements

---

# 🎯 What You'll Learn

After completing this lesson, you'll understand:

- Why loops are important
- How `for` loops work
- How `while` loops work
- Infinite loops
- `break`
- `continue`
- Reading files using loops
- Real-world DevOps examples
- Best practices
- Mini Project

---

# 🤔 Why Do We Need Loops?

Imagine you're managing a Kubernetes cluster.

Your manager asks:

> "Check whether all 100 pods are running."

Without loops, you would have to write:

```bash
kubectl get pod pod1

kubectl get pod pod2

kubectl get pod pod3

...

kubectl get pod pod100
```

That's repetitive, difficult to maintain, and prone to errors.

Instead, you let Bash repeat the same task automatically.

That's exactly what a **loop** does.

---

# 📖 What is a Loop?

A loop repeatedly executes a block of code until a condition changes or there are no more items to process.

Think of it like a washing machine.

```
Wash

↓

Rinse

↓

Spin

↓

Repeat
```

The same cycle is repeated automatically.

Programming works the same way.

---

# 🌍 Real-World DevOps Scenario

Suppose you have 20 Linux servers.

```
server01

server02

server03

...

server20
```

Instead of connecting manually:

```
SSH

↓

Run Command

↓

Disconnect

↓

Repeat
```

A loop can automate the entire process.

---

# 🔄 Types of Loops in Bash

Bash provides two commonly used loops.

```
Loops
   │
   ├───────────────┐
   │               │
   ▼               ▼
For Loop      While Loop
```

---

# 🔹 For Loop

A `for` loop is used when you already know what items you want to process.

Syntax:

```bash
for variable in list
do
    commands
done
```

---

# ⚙️ How a For Loop Works

```
Start

↓

Take First Item

↓

Execute Commands

↓

Take Next Item

↓

Execute Commands

↓

No More Items

↓

Stop
```

---

# 💻 Example 1 – Numbers

```bash
#!/bin/bash

for number in 1 2 3 4 5
do
    echo "$number"
done
```

Output

```
1

2

3

4

5
```

---

# 💻 Example 2 – Server Names

```bash
servers="web01 web02 web03"

for server in $servers
do
    echo "Connecting to $server..."
done
```

Output

```
Connecting to web01...

Connecting to web02...

Connecting to web03...
```

---

# 🚀 DevOps Example – Kubernetes Pods

```bash
for pod in $(kubectl get pods -o name)
do
    echo "Checking $pod"
done
```

This loops through every pod returned by `kubectl get pods`.

---

# 🚀 DevOps Example – Docker Containers

```bash
for container in $(docker ps --format "{{.Names}}")
do
    echo "Running Container: $container"
done
```

---

# 📖 While Loop

A `while` loop repeats as long as its condition remains true.

Syntax:

```bash
while condition
do
    commands
done
```

---

# ⚙️ How a While Loop Works

```
Check Condition

↓

True?

↓

Execute Commands

↓

Check Again

↓

False?

↓

Stop
```

---

# 💻 Example 1 – Counter

```bash
count=1

while [ "$count" -le 5 ]
do

    echo "$count"

    ((count++))

done
```

Output

```
1

2

3

4

5
```

---

# 💻 Example 2 – Countdown

```bash
count=5

while [ "$count" -gt 0 ]
do

    echo "$count"

    ((count--))

done
```

Output

```
5

4

3

2

1
```

---

# 📖 Reading a File Using While

This is a very common DevOps pattern.

Suppose you have:

```
servers.txt
```

Contents:

```
web01

web02

db01
```

Script:

```bash
while read server
do

    echo "Checking $server"

done < servers.txt
```

Output

```
Checking web01

Checking web02

Checking db01
```

This is useful for processing:

- Server lists
- IP addresses
- Hostnames
- Deployment targets

---

# 🛑 Break Statement

Sometimes you want to stop the loop early.

```bash
for i in 1 2 3 4 5
do

    if [ "$i" -eq 3 ]
    then
        break
    fi

    echo "$i"

done
```

Output

```
1

2
```

The loop exits immediately when `i` becomes `3`.

---

# ⏭️ Continue Statement

Sometimes you want to skip only one iteration.

```bash
for i in 1 2 3 4 5
do

    if [ "$i" -eq 3 ]
    then
        continue
    fi

    echo "$i"

done
```

Output

```
1

2

4

5
```

The value `3` is skipped, but the loop continues.

---

# ♾️ Infinite Loops

A loop that never ends.

Example:

```bash
while true
do

    echo "Monitoring..."

    sleep 5

done
```

This is commonly used in monitoring scripts.

Always provide a way to stop an infinite loop (for example, by pressing `Ctrl+C` or checking a condition).

---

# 📊 Loop Comparison

| For Loop | While Loop |
|-----------|------------|
| Iterate over known items | Repeat while a condition is true |
| Great for lists | Great for monitoring |
| Simple syntax | Flexible |
| Common in automation | Common in polling scripts |

---

# 🚀 DevOps Example – Check Multiple Servers

```
servers.txt

↓

Loop

↓

SSH

↓

Run uptime

↓

Display Result
```

Script:

```bash
while read server
do

    echo "===== $server ====="

    ssh "$server" uptime

done < servers.txt
```

---

# 🚀 DevOps Example – Check Kubernetes Nodes

```bash
for node in $(kubectl get nodes --no-headers | awk '{print $1}')
do

    echo "Checking Node: $node"

done
```

---

# 🚀 DevOps Example – Restart Failed Services

```bash
services="nginx redis docker"

for service in $services
do

    systemctl restart "$service"

done
```

This pattern is useful when automating maintenance tasks.

---

# ⚠️ Common Mistakes

### ❌ Forgetting `done`

Every loop must end with:

```bash
done
```

---

### ❌ Infinite Loop by Mistake

Wrong:

```bash
count=1

while [ "$count" -le 5 ]
do

    echo "$count"

done
```

The counter never changes, so the condition is always true.

Remember to update the loop variable:

```bash
((count++))
```

---

### ❌ Unquoted Variables

Prefer:

```bash
echo "$server"
```

instead of:

```bash
echo $server
```

---

### ❌ Using Command Substitution with Large Output

For simple lists, `for item in $(command)` is fine.

For processing many lines or preserving spaces, prefer:

```bash
while IFS= read -r line
do
    echo "$line"
done < file.txt
```

This avoids issues with whitespace and backslashes.

---

# ✅ Best Practices

✔ Use `for` when iterating over a known list.

✔ Use `while` for condition-based repetition.

✔ Use `while IFS= read -r` when reading files.

✔ Keep loop bodies small.

✔ Use `break` and `continue` only when they improve readability.

✔ Avoid unnecessary nested loops.

---

# 🧪 Mini Project

Create a script named:

```text
cluster_health_check.sh
```

Requirements:

- Read node names from:

```
nodes.txt
```

Example:

```
node01

node02

node03
```

For each node:

- Print the node name.
- Check connectivity using `ping`.
- Display whether the node is reachable.

Expected output:

```
Checking node01

✅ Reachable

--------------------

Checking node02

❌ Unreachable

--------------------
```

---

# 🎯 Challenge

Modify the script so it:

- Counts the number of reachable nodes.
- Counts the number of unreachable nodes.
- Prints a summary at the end.

Example:

```
Reachable Nodes : 12

Unreachable Nodes : 2
```

---

# 💡 DevOps Tip

> [!TIP]
> Loops are the backbone of infrastructure automation. Whether you're checking hundreds of Kubernetes pods, deploying to multiple servers, rotating logs, or restarting services across a fleet, loops allow you to perform repetitive tasks consistently and efficiently. Combining loops with functions and `if` statements enables you to build powerful automation scripts with surprisingly little code.

---

# 📚 Summary

In this lesson, you learned:

- What loops are
- `for` loops
- `while` loops
- Reading files with `while`
- `break`
- `continue`
- Infinite loops
- DevOps automation examples
- Best practices

---

# ⏭️ Next Lesson

➡️ **12 - Case Statements**

In the final lesson of Day 01, you'll learn:

- What `case` statements are
- Why they're cleaner than long `if-elif-else` chains
- Pattern matching
- Wildcards
- Building interactive menus
- Creating a DevOps command-line utility

Happy scripting! 🚀
