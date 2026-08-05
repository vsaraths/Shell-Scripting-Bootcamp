## 🟠 Level 8

### Challenge 22

``` bash
#!/bin/bash
counter=1
while [ $counter -le 5 ]; do
  echo "High Five #$counter! 🖐️"
  ((counter++))
done
```

### Challenge 23

``` bash
#!/bin/bash
timer=10
while [ $timer -gt 0 ]; do
  echo "$timer..."
  ((timer--))
  sleep 1
done
echo "🚀 BLAST OFF!"
```

### Challenge 24

``` bash
#!/bin/bash
base=$1
multiplier=5
((product=base*multiplier))
echo "$base times $multiplier equals $product"
```

------------------------------------------------------------------------

## 🔴 Level 9

### Challenge 25

``` bash
#!/bin/bash
backup_folder="my_backups"
if [ ! -d "$backup_folder" ]; then
  echo "Directory not found. Creating $backup_folder..."
  mkdir "$backup_folder"
fi
```

Look confusing if you are seeing them for the first time? Let's break down each of these three challenges using simple, everyday analogies so they make total sense!

---

### The Directory Guard (`-d`)

### 💡 The Everyday Analogy
Imagine you want to build a house in a specific spot. Before bringing in the construction crew, you check: **"Is there already a house standing here?"**

* **If YES:** You do nothing (so you don't accidentally build over it).
* **If NO:** You build the house (`mkdir`).

---

### 🛠️ What the Code Means Line-by-Line
In Bash, the flag `-d` asks the computer: 

> *"Is this a Directory (folder)?"*

When you add the exclamation mark (`!`), it flips the question to mean **NOT**: 

> *"Does this folder NOT exist?"*

### Challenge 26

``` bash
#!/bin/bash
project="website"
version=2
filename="${project}_v${version}.tar.gz"
echo "Backup target name config: $filename"
```
### 💡 The Everyday Analogy
Imagine you have three separate magnetic word tiles on your fridge:

* `website`
* `_v`
* `2`
* `.tar.gz`

If you snap them all together side by side, they spell out one single long file name: `website_v2.tar.gz`.

---

### 🛠️ What the Code Means Line-by-Line
When variables sit right next to each other, Bash glues them together into one piece of text. We use curly braces `${}` around the variable names so Bash knows exactly where each variable name starts and ends.

### Challenge 27

``` bash
#!/bin/bash
echo "--- System Binary Search Paths ---"
echo -e "${PATH//:/\n}"
```

### Cleaning Up $PATH

Your system variable `$PATH` holds a list of folders where the computer searches for commands. But by default, Bash squishes all those folder paths together on one single line separated by colons (`:`), like this:

```text
/usr/bin:/bin:/usr/sbin:/sbin
