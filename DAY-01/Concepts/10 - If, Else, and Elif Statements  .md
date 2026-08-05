# 🔀 If, Else, and Elif Statements in Bash

> **Module:** Day-01 Concepts  
> **Lesson:** 10 - If, Else, and Elif Statements  
> **Difficulty:** 🟡 Beginner → Intermediate  
> **Prerequisites:** Understanding `if` statements

---

# 🎯 What You'll Learn

By the end of this lesson, you'll be able to:

- Understand `else` and `elif`
- Execute different code paths based on conditions
- Build multi-condition decision trees
- Validate user input
- Make environment-specific decisions
- Apply decision-making in real DevOps scripts

---

# 🤔 Why Do We Need Else and Elif?

Suppose you're writing a deployment script.

The user enters:

```
dev
```

Should the script deploy to production?

Of course not.

Now imagine the user enters:

```
staging
```

Should the same deployment settings be used?

Again, no.

Different environments require different actions.

Instead of writing multiple separate `if` statements, Bash allows us to write one structured decision block using:

- `if`
- `elif`
- `else`

---

# 📖 Understanding the Flow

Think of it like choosing a road at a traffic intersection.

```
             Environment?
                  │
      ┌───────────┼───────────┐
      │           │           │
     dev      staging      production
      │           │           │
      ▼           ▼           ▼
  Deploy Dev  Deploy Test  Deploy Prod
```

Only one path is chosen.

---

# ⚙️ How Bash Evaluates Multiple Conditions

```
Start
  │
  ▼
Check Condition 1
  │
 ┌┴─────────────┐
 │              │
True          False
 │              │
 ▼              ▼
Execute     Check Condition 2
                │
           ┌────┴────┐
           │         │
         True      False
           │         │
           ▼         ▼
      Execute     Else Block
```

Once a condition matches, Bash skips the remaining conditions.

---

# 📝 Basic Syntax

```bash
if [ condition ]
then
    commands

elif [ another_condition ]
then
    commands

else
    commands
fi
```

---

# 💻 Example 1 – Age Classification

```bash
#!/bin/bash

age=17

if [ "$age" -ge 18 ]
then
    echo "Adult"

else
    echo "Minor"
fi
```

Output:

```
Minor
```

---

# 💻 Example 2 – Student Grade

```bash
#!/bin/bash

marks=82

if [ "$marks" -ge 90 ]
then
    echo "Grade A"

elif [ "$marks" -ge 75 ]
then
    echo "Grade B"

elif [ "$marks" -ge 60 ]
then
    echo "Grade C"

else
    echo "Failed"
fi
```

Output:

```
Grade B
```

Notice that after `Grade B` matches, Bash does **not** check the remaining conditions.

---

# 📊 Decision Flow

```
Marks = 82
     │
     ▼
>=90 ?
     │
    No
     │
     ▼
>=75 ?
     │
    Yes
     │
     ▼
Print Grade B
```

---

# 🚀 DevOps Example – Deployment Environment

```bash
#!/bin/bash

read -p "Enter environment: " env

if [[ "$env" == "dev" ]]
then
    echo "Deploying to Development"

elif [[ "$env" == "staging" ]]
then
    echo "Deploying to Staging"

elif [[ "$env" == "production" ]]
then
    echo "Deploying to Production"

else
    echo "Invalid Environment"
fi
```

Example:

Input:

```
staging
```

Output:

```
Deploying to Staging
```

---

# 🚀 DevOps Example – Disk Usage Alert

```bash
usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$usage" -lt 60 ]
then
    echo "Disk usage is healthy."

elif [ "$usage" -lt 80 ]
then
    echo "Disk usage is getting high."

else
    echo "Critical: Disk usage above 80%!"
fi
```

---

# 🚀 DevOps Example – Kubernetes Namespace Validation

```bash
read -p "Namespace: " ns

if [[ "$ns" == "dev" ]]
then
    kubectl get pods -n dev

elif [[ "$ns" == "staging" ]]
then
    kubectl get pods -n staging

elif [[ "$ns" == "production" ]]
then
    kubectl get pods -n production

else
    echo "Namespace not recognized."
fi
```

---

# 🚀 DevOps Example – Service Status

```bash
service_status=$(systemctl is-active nginx)

if [[ "$service_status" == "active" ]]
then
    echo "Nginx is running."

elif [[ "$service_status" == "inactive" ]]
then
    echo "Nginx is stopped."

else
    echo "Service state: $service_status"
fi
```

This handles multiple possible service states gracefully.

---

# 📌 Nested If Statements

Sometimes you need an `if` inside another `if`.

Example:

```bash
read -p "Enter username: " user

if [[ "$user" == "admin" ]]
then

    read -s -p "Enter password: " password
    echo

    if [[ "$password" == "secret123" ]]
    then
        echo "Login Successful"
    else
        echo "Invalid Password"
    fi

else
    echo "Unknown User"
fi
```

Use nested conditions only when they improve clarity. Too many levels of nesting can make scripts difficult to read.

---

# ⚠️ Common Mistakes

### ❌ Forgetting `fi`

Every `if` block must end with:

```bash
fi
```

---

### ❌ Multiple Independent `if` Statements

Avoid:

```bash
if [[ "$env" == "dev" ]]
then
    echo "Development"
fi

if [[ "$env" == "staging" ]]
then
    echo "Staging"
fi
```

Use:

```bash
if
elif
else
```

This is more efficient because Bash stops checking after the first match.

---

### ❌ Incorrect Condition Order

Bad:

```bash
marks=95

if [ "$marks" -ge 60 ]
then
    echo "Grade C"

elif [ "$marks" -ge 90 ]
then
    echo "Grade A"
fi
```

The output will always be:

```
Grade C
```

because `95` is also greater than `60`.

Correct order:

```
90

↓

75

↓

60
```

Always check the most specific or highest threshold first when ranges overlap.

---

# ✅ Best Practices

✔ Keep conditions simple.

✔ Order conditions carefully.

✔ Use `elif` instead of multiple independent `if` statements when conditions are mutually exclusive.

✔ Quote variables.

✔ Print meaningful error messages in the `else` block.

---

# 🧪 Mini Project

Create a script named:

```text
deployment_selector.sh
```

Requirements:

1. Ask the user for an environment.
2. Support:
   - dev
   - test
   - staging
   - production
3. Display different deployment messages for each environment.
4. Show an error for invalid input.

Example:

```
Enter Environment:

production

-------------------------

Environment : Production

Approval Required

Starting Deployment...
```

---

# 💡 DevOps Tip

> [!TIP]
> Environment-specific automation is one of the most common uses of `if`, `elif`, and `else`. A single deployment script can safely handle development, testing, staging, and production simply by changing its execution path based on user input or environment variables.

---

# 📚 Summary

In this lesson, you learned:

- How `if`, `elif`, and `else` work together
- How Bash evaluates multiple conditions
- Why condition order matters
- Nested `if` statements
- Real-world DevOps examples
- Best practices for writing maintainable decision logic

---

# ⏭️ Next Lesson

➡️ **11 - While and For Loops**

You'll learn:

- Why loops are essential
- `for` loops
- `while` loops
- Loop control with `break` and `continue`
- Iterating over files, servers, Docker containers, and Kubernetes resources
- Practical DevOps automation examples

Happy scripting! 🚀
