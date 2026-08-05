# 📝 Basic String Operations in Bash

> **Module:** Day-01 Concepts  
> **Lesson:** 07 - Basic String Operations  
> **Difficulty:** 🟢 Beginner  
> **Prerequisites:** Variables and Command Substitution

---

# 🎯 What You'll Learn

After completing this lesson, you'll be able to:

- Understand strings in Bash
- Create and use string variables
- Concatenate strings
- Find string length
- Convert strings to uppercase and lowercase
- Extract substrings
- Replace text inside strings
- Compare strings
- Check whether a string is empty
- Apply string operations in real DevOps scenarios

---

# 🤔 Why Do We Need String Operations?

Imagine you're writing a deployment script.

A user enters:

```
Production
```

But your Kubernetes namespace is actually:

```
production
```

The deployment fails because Kubernetes namespaces are **case-sensitive**.

Instead of asking the user to type the exact value, your script can automatically convert the input to lowercase.

That's one example of why string operations are important.

---

# 📖 What is a String?

A string is simply a sequence of characters.

Examples:

```text
Sarath

DevOps

production

docker-image

v1.2.0
```

In Bash, strings are usually stored in variables.

```bash
name="Sarath"

echo "$name"
```

Output:

```
Sarath
```

---

# ⚙️ How Bash Stores Strings

```
Variable
   │
   ▼
+----------------------+
| name                 |
+----------------------+
| Sarath               |
+----------------------+
```

Whenever you use:

```bash
echo "$name"
```

Bash replaces `$name` with the stored value.

---

# 📊 String Operations Overview

```
                String
                  │
        ┌─────────┼─────────┐
        │         │         │
        ▼         ▼         ▼
 Length  Compare  Replace
        │         │
        ▼         ▼
 Uppercase Lowercase
        │
        ▼
Substring
```

---

# 💻 Creating a String

```bash
name="Sarath"

echo "$name"
```

Output:

```
Sarath
```

---

# 💻 Concatenating Strings

Two strings can be joined together.

```bash
first="Dev"

second="Ops"

result="$first$second"

echo "$result"
```

Output:

```
DevOps
```

Another example:

```bash
env="production"

echo "Deploying to $env environment"
```

Output:

```
Deploying to production environment
```

---

# 📏 Finding String Length

Use:

```bash
${#variable}
```

Example:

```bash
project="inventory"

echo "${#project}"
```

Output:

```
9
```

Explanation:

```
i n v e n t o r y
1 2 3 4 5 6 7 8 9
```

---

# ✂️ Extracting Part of a String

Syntax:

```bash
${variable:start:length}
```

Example:

```bash
version="v2.5.1"

echo "${version:1:3}"
```

Output:

```
2.5
```

Explanation:

```
v 2 . 5 . 1
0 1 2 3 4 5
```

Start at index **1** and take **3** characters.

---

# 🔄 Converting to Uppercase

```bash
environment="production"

echo "${environment^^}"
```

Output:

```
PRODUCTION
```

Useful for reports and log messages.

---

# 🔽 Converting to Lowercase

```bash
environment="PRODUCTION"

echo "${environment,,}"
```

Output:

```
production
```

This is especially useful for Kubernetes namespaces, Docker image names, and filenames.

---

# 🔁 Replacing Text

Syntax:

```bash
${variable/old/new}
```

Example:

```bash
file="app.log"

echo "${file/log/txt}"
```

Output:

```
app.txt
```

---

# 💻 String Comparison

Compare two strings using `=` inside `[[ ]]`.

```bash
env="production"

if [[ "$env" = "production" ]]
then
    echo "Deploying..."
fi
```

Output:

```
Deploying...
```

---

# ❓ Checking for an Empty String

Sometimes users press Enter without typing anything.

```bash
read -p "Enter project name: " project

if [[ -z "$project" ]]
then
    echo "Project name cannot be empty."
fi
```

`-z` checks whether the string has zero length.

---

# 🚀 DevOps Example – Docker Image Name

```bash
read -p "Enter image name: " image

image="${image,,}"

docker build -t "$image" .
```

Input:

```
MyApplication
```

Output:

```
myapplication
```

This ensures consistent image naming.

---

# 🚀 DevOps Example – Git Branch Name

```bash
branch=$(git branch --show-current)

echo "Current Branch: $branch"
```

You can also convert it to uppercase for logging:

```bash
echo "${branch^^}"
```

---

# 🚀 DevOps Example – Kubernetes Namespace

```bash
read -p "Namespace: " ns

ns="${ns,,}"

kubectl get pods -n "$ns"
```

Even if the user enters:

```
Production
```

the script converts it to:

```
production
```

---

# ⚠️ Common Mistakes

### ❌ Forgetting Quotes

Wrong:

```bash
echo $project
```

Preferred:

```bash
echo "$project"
```

Quoting prevents issues with spaces and special characters.

---

### ❌ Comparing with Single Brackets Incorrectly

Avoid:

```bash
[ $env = production ]
```

Prefer:

```bash
[[ "$env" = "production" ]]
```

`[[ ]]` provides safer string handling in Bash.

---

### ❌ Assuming User Input Has the Correct Case

Always normalize values when appropriate:

```bash
environment="${environment,,}"
```

---

# ✅ Best Practices

✔ Use descriptive variable names.

✔ Quote all variable expansions.

✔ Normalize user input when case matters.

✔ Validate strings before using them.

✔ Prefer `[[ ]]` for string comparisons.

---

# 🧪 Practice Exercise

Create a script named:

```text
project_info.sh
```

The script should:

1. Ask for a project name.
2. Display the original value.
3. Display the value in uppercase.
4. Display the value in lowercase.
5. Display the string length.
6. Display the first four characters.

Example:

```
Project Name : InventoryService

Uppercase : INVENTORYSERVICE

Lowercase : inventoryservice

Length : 16

First Four Characters : Inve
```

---

# 💡 DevOps Tip

> [!TIP]
> String manipulation is a daily task for DevOps engineers. You'll often modify Docker image tags, Git branch names, Kubernetes namespaces, file paths, URLs, cloud resource names, and environment variables. Learning these operations early will make your automation scripts cleaner and more reliable.

---

# 📚 Summary

In this lesson, you learned:

- What strings are
- How to concatenate strings
- How to find string length
- How to extract substrings
- How to convert case
- How to replace text
- How to compare strings
- How to check for empty strings
- Practical DevOps use cases

---

# ⏭️ Next Lesson

➡️ **08 - Functions in Bash**

In the next lesson, you'll learn:

- Why functions are important
- How to define and call functions
- Function parameters
- Return values and exit statuses
- Variable scope
- Real-world DevOps examples for reusable automation

Happy scripting! 🚀
