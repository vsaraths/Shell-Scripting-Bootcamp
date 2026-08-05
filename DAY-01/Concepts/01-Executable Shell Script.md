# 🚀 Create an Executable Shell Script

> **Module:** Day-01 Concepts  
> **Lesson:** 01 - Create Executable File  
> **Difficulty:** 🟢 Beginner  
> **Prerequisites:** Basic Linux Commands (`ls`, `chmod`, `pwd`)

---

# 🎯 What You'll Learn

By the end of this lesson, you'll understand:

- What an executable file is
- Why shell scripts need execute permission
- Linux file permissions (`Read`, `Write`, `Execute`)
- How the `chmod` command works
- Different ways to make a script executable
- Best practices followed in DevOps projects

---

# 🤔 Why Do We Need Executable Files?

Imagine you're a DevOps Engineer.

Every morning you need to:

- Check disk usage
- Restart failed services
- Take backups
- Clean old logs
- Verify Kubernetes pods

Typing these commands one by one every day is slow and error-prone.

Instead, you write them once in a shell script.

Example:

```bash
backup.sh
```

Now comes the important question.

How does Linux know this file should be executed instead of being treated as an ordinary text file?

That's where **execute permission** comes into the picture.

Without execute permission, Linux refuses to run the script.

---

# 🌍 Real-World DevOps Scenario

Suppose you're responsible for backing up application logs every night.

You create a script named:

```text
backup.sh
```

It contains:

```bash
#!/bin/bash

echo "Taking backup..."
```

You try to run it.

```bash
./backup.sh
```

Linux replies:

```text
Permission denied
```

Why?

Because the file doesn't have execute permission.

---

# 📖 Understanding File Permissions

Every file in Linux has permissions.

There are three types of permissions.

| Permission | Meaning |
|------------|---------|
| Read (r) | Can view the file |
| Write (w) | Can modify the file |
| Execute (x) | Can run the file as a program |

These permissions are assigned to:

- Owner
- Group
- Others

Example:

```text
-rwxr-xr--
```

Let's break it down.

```
- rwx r-x r--
│ │   │   │
│ │   │   └── Others
│ │   └────── Group
│ └────────── Owner
└──────────── File Type
```

---

# 📊 Understanding the Permission String

Example:

```text
-rwxr-xr--
```

```
┌────┬──────────────┐
│ -  │ Regular File │
├────┼──────────────┤
│ rwx│ Owner        │
│ r-x│ Group        │
│ r--│ Others       │
└────┴──────────────┘
```

Meaning:

Owner can:

- Read
- Write
- Execute

Group can:

- Read
- Execute

Others can:

- Read only

---

# 🔍 Check File Permissions

Use:

```bash
ls -l
```

Example:

```text
-rw-r--r-- 1 ubuntu ubuntu 135 Jul 20 backup.sh
```

Notice:

```text
-rw-r--r--
```

There is **no x**.

That means the script cannot be executed.

---

# ⚙️ Making a Script Executable

Use:

```bash
chmod +x backup.sh
```

Now check again.

```bash
ls -l
```

Output:

```text
-rwxr-xr-x
```

The execute permission has been added.

Now Linux allows the script to run.

---

# 📊 What Happens Internally?

```
          User
            │
            ▼
      ./backup.sh
            │
            ▼
Linux checks permissions
            │
            ▼
Does file have Execute permission?
        │
   ┌────┴────┐
   │         │
  Yes        No
   │         │
   ▼         ▼
Execute   Permission Denied
Script
```

---

# 💻 Example 1

Create a file.

```bash
touch hello.sh
```

Open it.

```bash
nano hello.sh
```

Write:

```bash
#!/bin/bash

echo "Hello DevOps!"
```

Save it.

Try running.

```bash
./hello.sh
```

Output:

```text
Permission denied
```

Now:

```bash
chmod +x hello.sh
```

Run again.

```bash
./hello.sh
```

Output:

```text
Hello DevOps!
```

---

# 💻 Example 2

Instead of:

```bash
chmod +x script.sh
```

You can use numeric permissions.

```bash
chmod 755 script.sh
```

Meaning:

```
7 = Read + Write + Execute

5 = Read + Execute

5 = Read + Execute
```

Result:

```text
Owner : rwx

Group : r-x

Others : r-x
```

---

# 🚀 DevOps Example

Suppose you have a deployment script.

```bash
deploy.sh
```

```bash
#!/bin/bash

echo "Building Docker Image..."

docker build -t myapp .

echo "Deploying..."

kubectl apply -f deployment.yaml
```

Before running:

```bash
chmod +x deploy.sh
```

Execute:

```bash
./deploy.sh
```

This is how deployment scripts are commonly executed in DevOps workflows.

---

# ⚠️ Common Mistakes

### ❌ Forgetting execute permission

```bash
./script.sh
```

Result:

```text
Permission denied
```

---

### ❌ Running from the wrong directory

Always check:

```bash
pwd
```

---

### ❌ Wrong filename

Linux is case-sensitive.

```text
backup.sh
```

is different from

```text
Backup.sh
```

---

### ❌ Assuming every file is executable

Only files with execute permission can be run directly.

---

# ✅ Best Practices

✔ Give execute permission only to files that need it.

✔ Use meaningful script names.

```text
backup_database.sh

cleanup_logs.sh

deploy_application.sh
```

✔ Keep scripts inside a dedicated folder.

Example:

```text
scripts/

deployment/

automation/
```

✔ Always use a shebang (`#!/bin/bash`) at the beginning of executable shell scripts. We'll learn more about this in the next lesson.

---

# 🧪 Practice Exercise

Create a script named:

```text
system_info.sh
```

The script should display:

- Current user
- Current directory
- Current date
- Hostname

Make it executable and run it.

Expected output:

```text
Current User : ubuntu

Current Directory : /home/ubuntu

Current Date : Tue Jul 20

Hostname : ip-172-31-18-25
```

---

# 💡 DevOps Tip

> [!TIP]
> In CI/CD tools such as Jenkins, GitHub Actions, GitLab CI/CD, and Azure DevOps, shell scripts are often executed automatically. If the script doesn't have execute permission (or isn't invoked through a shell interpreter), your pipeline may fail with a **Permission denied** error. Understanding Linux file permissions is essential for troubleshooting these issues.

---

# 📚 Summary

In this lesson, you learned:

- What an executable file is
- Why execute permission is required
- How Linux file permissions work
- How to check permissions using `ls -l`
- How to make a file executable using `chmod +x`
- How executable scripts are commonly used in DevOps automation

---

# ⏭️ Next Lesson

➡️ **02 - Shebang (`#!/bin/bash`)**

In the next lesson, you'll learn:

- What a shebang is
- Why it's required
- How Linux chooses the correct interpreter
- Difference between `#!/bin/bash` and `#!/usr/bin/env bash`
- Best practices for writing portable shell scripts

Happy scripting! 🚀
