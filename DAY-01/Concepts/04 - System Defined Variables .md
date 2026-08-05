# 🌍 System Defined Variables (Environment Variables)

> **Module:** Day-01 Concepts  
> **Lesson:** 04 - System Defined Variables  
> **Difficulty:** 🟢 Beginner

---

# 🎯 What You'll Learn

After completing this lesson, you'll understand:

- What variables are
- What system-defined (environment) variables are
- Difference between user-defined and system-defined variables
- Common Linux environment variables
- How to view and use them
- Real DevOps use cases

---

# 🤔 Why Do We Need Variables?

Imagine you're writing a backup script.

Without variables:

```bash
cp /home/sarath/project/config.yaml /backup/
```

Now imagine another developer named **John** runs the same script.

The script fails because John's home directory is:

```text
/home/john
```

instead of

```text
/home/sarath
```

Hardcoding values makes scripts difficult to reuse.

Variables solve this problem.

---

# 📖 What is a Variable?

A variable is simply a **named container** that stores a value.

Instead of writing the same value repeatedly, you store it once and reuse it whenever needed.

Example:

```bash
name="Sarath"

echo "$name"
```

Output:

```text
Sarath
```

Think of a variable as a labeled box.

```
+----------------+
|     name       |
+----------------+
|    Sarath      |
+----------------+
```

Whenever you ask for `name`, Bash gives you the value stored inside the box.

---

# 📖 What Are System Defined Variables?

System-defined variables (also called **environment variables**) are variables that Linux or your shell creates automatically.

They contain useful information about your current environment, such as:

- Your username
- Your home directory
- Current working directory
- Default shell
- Search path for commands
- Hostname

These variables are available to every shell session.

---

# 🌍 Real-World DevOps Scenario

Imagine you're deploying an application.

Instead of writing:

```bash
cp config.yaml /home/sarath/deployment/
```

you write:

```bash
cp config.yaml "$HOME/deployment/"
```

Now the script works for every user because `$HOME` automatically points to the current user's home directory.

---

# 📊 User Defined vs System Defined Variables

| User Defined | System Defined |
|---------------|----------------|
| Created by you | Created by Linux/Shell |
| Store custom values | Store system information |
| Exists only when defined | Available automatically |
| Example: `project="demo"` | Example: `$HOME` |

---

# ⚙️ How Environment Variables Work

When you log in:

```
User Login
     │
     ▼
Linux starts Shell
     │
     ▼
Shell loads Environment Variables
     │
     ▼
HOME
USER
PATH
PWD
SHELL
HOSTNAME
     │
     ▼
Available to your scripts
```

Every shell script can access these variables.

---

# 📋 Viewing Environment Variables

To see all environment variables:

```bash
printenv
```

or

```bash
env
```

Example:

```text
HOME=/home/sarath

USER=sarath

PWD=/home/sarath

SHELL=/bin/bash
```

---

# 📌 Common System Variables

## 1. HOME

Shows your home directory.

```bash
echo "$HOME"
```

Output:

```text
/home/sarath
```

---

## 2. USER

Displays the current logged-in user.

```bash
echo "$USER"
```

Output:

```text
sarath
```

---

## 3. PWD

Shows your current working directory.

```bash
echo "$PWD"
```

Output:

```text
/home/sarath/projects
```

---

## 4. SHELL

Displays your default shell.

```bash
echo "$SHELL"
```

Output:

```text
/bin/bash
```

---

## 5. HOSTNAME

Shows the computer or server name.

```bash
echo "$HOSTNAME"
```

Output:

```text
ip-172-31-18-25
```

---

## 6. PATH

One of the most important environment variables.

```bash
echo "$PATH"
```

Example:

```text
/usr/local/bin:/usr/bin:/bin
```

---

# 📖 Understanding PATH

Suppose you type:

```bash
kubectl
```

How does Linux know where `kubectl` is installed?

It searches every directory listed in `$PATH`.

```
User types

kubectl
    │
    ▼
Check PATH
    │
    ▼
/usr/local/bin
    │
    ▼
Found?
    │
 ┌──┴───────┐
 │          │
Yes         No
 │          │
 ▼          ▼
Execute   Check next directory
```

Without `$PATH`, you would have to run:

```bash
/usr/local/bin/kubectl
```

every single time.

---

# 💻 Example 1

```bash
#!/bin/bash

echo "Current User : $USER"

echo "Home Directory : $HOME"

echo "Current Directory : $PWD"
```

Output:

```text
Current User : sarath

Home Directory : /home/sarath

Current Directory : /home/sarath
```

---

# 💻 Example 2

Create a folder inside the current user's home directory.

```bash
mkdir "$HOME/projects"
```

No matter who runs the script, it creates the folder inside **their** home directory.

---

# 🚀 DevOps Example

Imagine you're writing a deployment script.

```bash
#!/bin/bash

echo "Deploying application..."

echo "User : $USER"

echo "Server : $HOSTNAME"

echo "Working Directory : $PWD"

kubectl get nodes
```

This makes the script portable across different environments.

---

# 💡 Environment Variables in CI/CD

Almost every CI/CD platform uses environment variables.

Examples:

GitHub Actions

```text
GITHUB_WORKSPACE

GITHUB_SHA

GITHUB_REF
```

GitLab CI

```text
CI_COMMIT_SHA

CI_PROJECT_DIR
```

Jenkins

```text
BUILD_NUMBER

JOB_NAME

WORKSPACE
```

Azure DevOps

```text
BUILD_BUILDNUMBER

SYSTEM_TEAMPROJECT
```

Understanding environment variables is essential for automation pipelines.

---

# ⚠️ Common Mistakes

### ❌ Forgetting `$`

Wrong:

```bash
echo HOME
```

Output:

```text
HOME
```

Correct:

```bash
echo "$HOME"
```

---

### ❌ Overwriting Important Variables

Bad:

```bash
PATH="abc"
```

Now many commands may stop working because the shell no longer knows where to find them.

---

### ❌ Hardcoding Paths

Instead of:

```bash
/home/sarath/project
```

prefer:

```bash
"$HOME/project"
```

This makes scripts reusable.

---

# ✅ Best Practices

✔ Use system variables whenever possible.

✔ Quote variable expansions:

```bash
"$HOME"
```

instead of

```bash
$HOME
```

to avoid issues with spaces.

✔ Avoid modifying critical environment variables like `PATH` unless necessary.

✔ Use meaningful names for your own variables.

---

# 🧪 Practice Exercise

Create a script named:

```text
system_details.sh
```

The script should display:

- Username
- Home Directory
- Current Directory
- Hostname
- Default Shell

Expected output:

```text
Username : sarath

Home Directory : /home/sarath

Current Directory : /home/sarath

Hostname : ip-172-31-18-25

Shell : /bin/bash
```

---

# 💡 DevOps Tip

> [!TIP]
> Cloud platforms, Docker containers, Kubernetes Pods, Jenkins pipelines, GitHub Actions, and Terraform all rely heavily on environment variables. Secrets, API keys, regions, and deployment settings are often passed through environment variables instead of being hardcoded into scripts.

---

# 📚 Summary

In this lesson, you learned:

- What variables are
- What system-defined variables are
- Difference between user-defined and system-defined variables
- Common environment variables like `HOME`, `USER`, `PWD`, `PATH`, `SHELL`, and `HOSTNAME`
- Why environment variables are essential in DevOps automation

---

# ⏭️ Next Lesson

➡️ **05 - Fetching User Input**

In the next lesson, you'll learn how to:

- Read input from the keyboard using `read`
- Prompt users for values
- Hide passwords while typing
- Validate user input
- Use interactive scripts in real-world DevOps tasks

Happy scripting! 🚀
