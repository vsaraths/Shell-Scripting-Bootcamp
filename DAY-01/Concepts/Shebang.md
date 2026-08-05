# 🐚 Shebang (`#!/bin/bash`)

> **Module:** Day-01 Concepts  
> **Lesson:** 02 - Shebang  
> **Difficulty:** 🟢 Beginner  
> **Prerequisites:** Understanding executable files (`chmod +x`)

---

# 🎯 What You'll Learn

By the end of this lesson, you'll understand:

- What a shebang is
- Why every shell script should start with a shebang
- How Linux decides which program executes your script
- Difference between `#!/bin/bash` and `#!/usr/bin/env bash`
- Common mistakes beginners make
- Best practices followed in DevOps projects

---

# 🤔 Why Do We Need a Shebang?

Imagine you're a DevOps Engineer.

You have written a deployment script called:

```text
deploy.sh
```

The script contains:

```bash
echo "Deploying application..."
```

You make it executable.

```bash
chmod +x deploy.sh
```

Now you execute it.

```bash
./deploy.sh
```

Sometimes it works.

Sometimes it doesn't.

Sometimes Bash runs it.

Sometimes another shell like **sh** or **dash** runs it.

Why?

Because Linux needs to know **which program (interpreter)** should read and execute your script.

That's exactly what the **shebang** tells Linux.

---

# 📖 What is a Shebang?

A **Shebang** is the very first line of a shell script.

Example:

```bash
#!/bin/bash
```

It tells Linux:

> "Use the Bash interpreter to execute this file."

Without it, Linux has to guess how the file should be executed, which can lead to unexpected behavior.

---

# 🧐 Why Is It Called "Shebang"?

The name comes from the first two characters:

```text
#
!
```

- `#` is commonly called **hash**
- `!` is commonly called **bang**

Together:

```
Hash + Bang

↓

Shebang
```

---

# 🌍 Real-World DevOps Scenario

Suppose your deployment script contains Bash-specific features:

```bash
#!/bin/bash

servers=("web1" "web2" "web3")

echo "${servers[0]}"
```

If another shell executes this script instead of Bash, it may fail because arrays are a Bash feature and are not supported by every shell.

The shebang ensures the correct interpreter is used every time.

---

# ⚙️ How Linux Executes a Script

When you type:

```bash
./deploy.sh
```

Linux does **not** immediately execute the commands inside the file.

Instead, it follows these steps.

```
User
 │
 ▼
./deploy.sh
 │
 ▼
Linux Kernel
 │
 ▼
Read first line
 │
 ▼
#!/bin/bash
 │
 ▼
Locate Bash Interpreter
 │
 ▼
Start Bash
 │
 ▼
Bash Reads Script
 │
 ▼
Execute Commands
 │
 ▼
Display Output
```

The first line determines which program will execute the rest of the file.

---

# 📊 Internal Workflow

```
+----------------------+
| User runs script     |
+----------+-----------+
           |
           v
+----------------------+
| Linux Kernel         |
+----------+-----------+
           |
           v
+----------------------+
| Read first line      |
| #!/bin/bash          |
+----------+-----------+
           |
           v
+----------------------+
| Launch /bin/bash     |
+----------+-----------+
           |
           v
+----------------------+
| Bash executes file   |
+----------------------+
```

---

# 💻 Basic Example

```bash
#!/bin/bash

echo "Hello DevOps!"
```

Run:

```bash
chmod +x hello.sh

./hello.sh
```

Output:

```text
Hello DevOps!
```

---

# 📝 Breaking Down the Shebang

```
#!/bin/bash
```

Let's understand each part.

| Part | Meaning |
|------|----------|
| `#!` | Indicates this is a shebang |
| `/bin/bash` | Path to the Bash interpreter |

Linux reads the interpreter path and starts that program.

---

# 📍 How to Find the Bash Interpreter

Different Linux distributions may install Bash in different locations.

To check where Bash is installed:

```bash
which bash
```

Example output:

```text
/bin/bash
```

or

```text
/usr/bin/bash
```

The output tells you the correct interpreter path.

---

# 💻 Another Example

```bash
#!/bin/bash

name="Sarath"

echo "Welcome $name"
```

Output:

```text
Welcome Sarath
```

---

# 🚀 DevOps Example

A backup automation script:

```bash
#!/bin/bash

DATE=$(date +%F)

tar -czf backup-$DATE.tar.gz /var/www

echo "Backup Completed"
```

The shebang guarantees that Bash interprets the script, ensuring consistent behavior across environments.

---

# 🌍 `#!/bin/bash` vs `#!/usr/bin/env bash`

This is one of the most frequently asked interview questions.

### Option 1

```bash
#!/bin/bash
```

Linux directly executes Bash from:

```
/bin/bash
```

Advantages:

- Faster
- Simple
- Common on most Linux systems

Disadvantages:

- Assumes Bash is always located in `/bin/bash`

---

### Option 2

```bash
#!/usr/bin/env bash
```

Instead of using a fixed path, Linux first runs:

```bash
env
```

The `env` command searches your system's `PATH` environment variable to locate the Bash executable.

Workflow:

```
Script
 │
 ▼
env
 │
 ▼
Search PATH
 │
 ▼
Find bash
 │
 ▼
Execute Script
```

Advantages:

- More portable
- Works across different Linux distributions
- Preferred for open-source projects

Disadvantages:

- Slightly slower because it performs a lookup

---

# 📊 Comparison

| `#!/bin/bash` | `#!/usr/bin/env bash` |
|---------------|------------------------|
| Fixed path | Searches PATH |
| Slightly faster | More portable |
| Great for controlled environments | Great for open-source projects |
| Common in servers | Common in cross-platform repositories |

---

# ⚠️ Common Mistakes

### ❌ Placing the shebang on the second line

Wrong:

```bash
echo "Hello"

#!/bin/bash
```

The shebang **must** be the very first line.

---

### ❌ Typing the wrong interpreter path

Wrong:

```bash
#!/bin/bsh
```

Linux cannot find the interpreter.

---

### ❌ Forgetting execute permission

Even with a valid shebang:

```bash
./script.sh
```

will fail if execute permission is missing.

---

### ❌ Using Bash features with `sh`

This may work:

```bash
#!/bin/sh
```

But Bash-specific features like arrays or `[[ ]]` may fail.

---

# ✅ Best Practices

✔ Always place the shebang on the first line.

✔ Use Bash when writing Bash scripts.

✔ For open-source repositories, consider:

```bash
#!/usr/bin/env bash
```

✔ Keep your scripts portable.

✔ Verify the interpreter path with:

```bash
which bash
```

---

# 🧪 Practice Exercise

Create a file named:

```text
greeting.sh
```

The script should:

- Use a shebang
- Print "Welcome to Bash"
- Print the current user
- Print the current date

Make it executable and run it.

Expected output:

```text
Welcome to Bash

Current User : ubuntu

Current Date : Tue Jul 20
```

---

# 💡 DevOps Tip

> [!TIP]
> Most automation tools—including Jenkins, GitHub Actions, GitLab CI/CD, Ansible, Kubernetes Jobs, and Azure DevOps—execute shell scripts. Using a proper shebang ensures the correct interpreter is used, reducing environment-specific issues and making your automation more reliable.

---

# 📚 Summary

In this lesson, you learned:

- What a shebang is
- Why Linux needs it
- How Linux chooses an interpreter
- How `#!/bin/bash` works
- Difference between `#!/bin/bash` and `#!/usr/bin/env bash`
- Best practices for writing portable Bash scripts

---

# ⏭️ Next Lesson

➡️ **03 - Reserved Keywords**

You'll learn:

- What reserved keywords are
- Why they cannot be used as variable names
- How Bash parses keywords
- Commonly used Bash keywords (`if`, `then`, `for`, `while`, `case`, `function`, `do`, `done`, etc.)
- Real-world DevOps examples using these keywords

Happy scripting! 🚀
