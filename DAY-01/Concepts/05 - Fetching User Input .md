# ⌨️ Fetching User Input in Bash

> **Module:** Day-01 Concepts  
> **Lesson:** 05 - Fetching User Input  
> **Difficulty:** 🟢 Beginner

---

# 🎯 What You'll Learn

By the end of this lesson, you'll be able to:

- Understand why user input is important
- Read user input using the `read` command
- Display prompts using `-p`
- Hide sensitive input using `-s`
- Read multiple values at once
- Set a timeout for user input
- Build interactive shell scripts
- Apply these techniques in DevOps automation

---

# 🤔 Why Do We Need User Input?

Imagine you wrote a deployment script like this:

```bash
kubectl apply -f production.yaml
```

Tomorrow, you need to deploy to **staging** instead.

Now you edit the script.

The next day, you deploy to **development**.

Again, you edit the script.

This isn't practical.

Instead, let the user decide.

```
Enter Environment:

production
staging
development
```

The same script now works everywhere.

That's why we fetch user input.

---

# 📖 What is the `read` Command?

The `read` command pauses the script and waits for the user to type something.

Whatever the user enters is stored inside a variable.

Syntax:

```bash
read variable_name
```

Example:

```bash
echo "Enter your name"

read name

echo "Welcome $name"
```

Output:

```
Enter your name

Sarath

Welcome Sarath
```

---

# ⚙️ How It Works Internally

```
Script Starts
      │
      ▼
Execute read
      │
      ▼
Pause Execution
      │
      ▼
Wait for Keyboard Input
      │
      ▼
Store Input in Variable
      │
      ▼
Continue Script
```

---

# 📊 Visual Diagram

```
+--------------------+
| Script             |
+---------+----------+
          |
          v
+--------------------+
| read username      |
+---------+----------+
          |
          v
+--------------------+
| User types: sarath |
+---------+----------+
          |
          v
+--------------------+
| username=sarath    |
+--------------------+
```

---

# 💻 Example 1 – Basic Input

```bash
#!/bin/bash

echo "Enter your name"

read name

echo "Hello $name"
```

---

# 💻 Example 2 – Using a Prompt

Instead of using `echo`, Bash allows you to display a prompt directly.

```bash
read -p "Enter your age: " age

echo "Your age is $age"
```

This produces a cleaner user experience.

---

# 🔒 Reading Passwords Securely

When entering passwords, you usually don't want them displayed on the screen.

Use the `-s` option.

```bash
read -s -p "Enter Password: " password

echo

echo "Password received."
```

Notice:

- Characters are hidden while typing.
- The password is still stored in the variable.

> [!WARNING]
> Avoid printing passwords back to the terminal or storing them in plain text. Use secure secret-management solutions (such as Kubernetes Secrets, Vault, or your CI/CD platform's secret store) for production systems.

---

# ⏱️ Waiting for Input with a Timeout

Sometimes a script shouldn't wait forever.

Example:

```bash
read -t 10 -p "Press Enter within 10 seconds: " input
```

If the user doesn't respond within 10 seconds, `read` returns a non-zero exit status.

This is useful in automation or menu-driven scripts.

---

# 👥 Reading Multiple Values

You can read more than one value at once.

```bash
read -p "Enter first and last name: " first last

echo "First Name : $first"

echo "Last Name  : $last"
```

Input:

```
Sarath V
```

Output:

```
First Name : Sarath

Last Name  : V
```

---

# 🚀 DevOps Example – Deployment Environment

```bash
#!/bin/bash

read -p "Enter Kubernetes Namespace: " namespace

kubectl get pods -n "$namespace"
```

Example:

```
Enter Kubernetes Namespace:

production
```

Output:

```
Listing pods in production namespace...
```

The script can now work with any namespace without modification.

---

# 🚀 DevOps Example – Docker Image Tag

```bash
#!/bin/bash

read -p "Enter Docker Image Tag: " tag

docker build -t myapp:"$tag" .
```

Input:

```
v1.0.3
```

The resulting image is tagged appropriately.

---

# ✅ Input Validation

Don't assume the user entered valid data.

Example:

```bash
read -p "Enter environment (dev/staging/prod): " env

if [[ "$env" != "dev" && "$env" != "staging" && "$env" != "prod" ]]
then
    echo "Invalid environment."
    exit 1
fi

echo "Deploying to $env..."
```

Input validation prevents accidental mistakes.

---

# ⚠️ Common Mistakes

### ❌ Forgetting the Variable Name

Wrong:

```bash
read
```

No variable is specified, making the input difficult to use.

---

### ❌ Not Quoting Variables

Wrong:

```bash
echo $name
```

Preferred:

```bash
echo "$name"
```

Quoting helps avoid issues with spaces or special characters.

---

### ❌ Printing Passwords

Avoid:

```bash
echo "$password"
```

Sensitive information should not be echoed back to the terminal.

---

### ❌ Assuming Input Is Always Correct

Always validate important values before using them.

---

# ✅ Best Practices

✔ Use descriptive prompts.

✔ Validate user input.

✔ Hide passwords with `read -s`.

✔ Quote variables.

✔ Provide meaningful error messages.

✔ Use defaults or validation for production scripts.

---

# 🧪 Practice Exercise

Create a script named:

```text
deploy.sh
```

Requirements:

1. Ask for the Kubernetes namespace.
2. Ask for the Docker image tag.
3. Ask for the application name.
4. Display a deployment summary.

Example output:

```
Application : inventory-service

Namespace  : production

Image Tag  : v2.1.0

Starting deployment...
```

---

# 💡 DevOps Tip

> [!TIP]
> Interactive scripts are useful for learning and manual administration, but production automation usually avoids prompts. CI/CD pipelines pass values through command-line arguments, configuration files, or environment variables so scripts can run unattended.

---

# 📚 Summary

In this lesson, you learned:

- How to use the `read` command
- How to display prompts with `-p`
- How to hide passwords with `-s`
- How to set timeouts using `-t`
- How to read multiple values
- Why input validation is important
- Real DevOps use cases for interactive scripts

---

# ⏭️ Next Lesson

➡️ **06 - Storing Command Outputs**

You'll learn:

- Command substitution (`$(...)`)
- Legacy backticks (`` `...` ``)
- Capturing command output
- Why `$(...)` is preferred
- Real-world DevOps examples using `kubectl`, `docker`, `date`, and more.

Happy scripting! 🚀
