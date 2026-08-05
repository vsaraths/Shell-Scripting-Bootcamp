# 🔑 Reserved Keywords in Bash

> **Module:** Day-01 Concepts  
> **Lesson:** 03 - Reserved Keywords  
> **Difficulty:** 🟢 Beginner

---

# 🎯 What You'll Learn

After completing this lesson, you'll understand:

- What reserved keywords are
- Why Bash reserves certain words
- Why they cannot be used as variable names
- Common reserved keywords
- How Bash interprets them
- Practical DevOps examples

---

# 🤔 Why Should You Learn Reserved Keywords?

Imagine you're writing your first Bash script.

You write:

```bash
if="production"
```

You save the file.

Run it.

Suddenly Bash throws an error.

You didn't make a spelling mistake.

The problem is that **`if` is a reserved keyword**.

Bash already knows what `if` means.

You can't redefine it.

Understanding reserved keywords will save you from confusing syntax errors and help you write clean, readable scripts.

---

# 📖 What Are Reserved Keywords?

Reserved keywords are **special words built into the Bash language**.

They have predefined meanings and are used to control the flow of a script.

Think of them as the grammar of Bash.

Just as English uses words like:

- if
- then
- else

Bash also uses these words to understand what your script is trying to do.

---

# 🌍 Real-World Analogy

Imagine you're writing a book.

Words like

- Chapter
- Title
- Index

already have special meanings.

You wouldn't rename "Chapter" to mean "Coffee".

Similarly, Bash expects keywords like `if`, `for`, and `while` to perform specific tasks.

---

# ⚙️ How Bash Reads Your Script

When Bash starts reading a script, it processes it line by line.

```
Script
   │
   ▼
Read first word
   │
   ▼
Is it a keyword?
   │
 ┌─┴──────────┐
 │            │
Yes          No
 │            │
 ▼            ▼
Special     Treat as
Meaning     command/variable
```

If Bash encounters:

```bash
if
```

it immediately knows a conditional statement is beginning.

---

# 📋 Common Reserved Keywords

| Keyword | Purpose |
|----------|----------|
| if | Conditional execution |
| then | Begins commands after `if` |
| else | Runs when condition is false |
| elif | Additional condition |
| fi | Ends an `if` block |
| for | Loop through items |
| while | Repeat while condition is true |
| do | Starts loop body |
| done | Ends loop |
| case | Multi-way branching |
| esac | Ends `case` statement |
| function | Defines a function |
| in | Used with `for` and `case` |
| select | Creates interactive menus |
| until | Loop until condition becomes true |
| break | Exit loop |
| continue | Skip current iteration |

---

# 📊 Visual Overview

```
              Bash Script
                   │
                   ▼
        ┌───────────────────┐
        │ Reserved Keyword? │
        └─────────┬─────────┘
                  │
        ┌─────────┴─────────┐
        │                   │
      Yes                  No
        │                   │
        ▼                   ▼
 Control Flow       Variable / Command
```

---

# 💻 Example 1 – Using `if`

```bash
#!/bin/bash

age=20

if [ "$age" -ge 18 ]
then
    echo "Adult"
fi
```

Here:

- `if` starts the condition.
- `then` starts the block to execute if the condition is true.
- `fi` closes the conditional block.

---

# 💻 Example 2 – Using `for`

```bash
#!/bin/bash

for server in web1 web2 web3
do
    echo "Checking $server..."
done
```

Output:

```text
Checking web1...
Checking web2...
Checking web3...
```

---

# 🚀 DevOps Example

Suppose you want to check the status of multiple Kubernetes pods.

```bash
#!/bin/bash

for pod in $(kubectl get pods -o name)
do
    echo "Inspecting $pod"
done
```

Here:

- `for` repeats the operation.
- `do` starts the loop body.
- `done` marks the end of the loop.

This pattern is extremely common in DevOps automation.

---

# ❌ Can Reserved Keywords Be Used as Variable Names?

No.

The following is **incorrect**:

```bash
if="production"
```

Similarly:

```bash
for="server"
```

```bash
while="true"
```

These names are reserved by Bash and should not be used for variables or functions.

---

# ⚠️ Common Mistakes

### ❌ Forgetting `fi`

```bash
if [ "$x" -eq 1 ]
then
    echo "Hello"
```

Result:

```text
syntax error: unexpected end of file
```

Because every `if` must end with `fi`.

---

### ❌ Forgetting `done`

```bash
for i in 1 2 3
do
    echo "$i"
```

Result:

```text
syntax error
```

Always close loops with `done`.

---

### ❌ Misspelling Keywords

Wrong:

```bash
iff
```

Correct:

```bash
if
```

Bash keywords must be spelled exactly.

---

# ✅ Best Practices

✔ Use descriptive variable names.

Good:

```bash
environment="production"
```

Bad:

```bash
if="production"
```

✔ Indent code inside blocks for readability.

✔ Always close control structures (`fi`, `done`, `esac`).

✔ Keep scripts simple and consistent.

---

# 💡 Did You Know?

> [!NOTE]
> Unlike many programming languages, Bash uses closing keywords such as `fi`, `done`, and `esac` instead of braces (`}`) to mark the end of blocks.

---

# 🧪 Practice Exercise

Create a script named:

```text
server_check.sh
```

Requirements:

- Loop through three server names:
  - web01
  - web02
  - web03
- Print:

```text
Checking web01...
Checking web02...
Checking web03...
```

---

# 💡 DevOps Tip

> [!TIP]
> Reserved keywords form the foundation of almost every automation script you'll write. Whether you're deploying applications, backing up databases, checking Kubernetes resources, or managing cloud infrastructure, you'll constantly use `if`, `for`, `while`, `case`, and `function`.

---

# 📚 Summary

In this lesson, you learned:

- What reserved keywords are
- Why Bash reserves them
- Common Bash keywords
- How Bash interprets them
- Why they should not be used as variable names
- How they appear in real DevOps scripts

---

# ⏭️ Next Lesson

➡️ **04 - System Defined Variables**

You'll learn:

- What environment variables are
- Difference between system and user-defined variables
- Important variables like `HOME`, `PATH`, `USER`, `PWD`, `SHELL`, and `HOSTNAME`
- How DevOps engineers use them in automation scripts

Happy scripting! 🚀
