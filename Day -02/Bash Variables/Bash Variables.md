# Bash Scripting: Variables Guide

A comprehensive guide to using variables in Bash scripting, including assignment, proper quoting, scoping with curly braces, and handling command-line arguments.

---

## 1. Introduction to Variables

As in any other programming language, you can use variables in Bash scripting. However, there are **no data types**; a variable in Bash can contain numbers as well as characters seamlessly.

### Variable Assignment
To assign a value to a variable, use the `=` sign:

```bash
name="DevDojo"
```

> ⚠️ **IMPORTANT NOTE:** You **cannot** have spaces before and after the `=` sign. 
> * `name = "DevDojo"` (Incorrect - will throw a command not found error)
> * `name="DevDojo"` (Correct)

### Accessing Variables
To access the value of a variable, prefix the variable name with the `$` symbol:

```bash
echo "$name"
```
**Output:**
```text
DevDojo
```

---

## 2. Quoting Variables

You should **always** wrap variable references in double quotes (`"$name"`). This is one of the most important habits to develop in Bash scripting. Without quotes, Bash will perform **word splitting** and **globbing** on the variable's value, which can lead to bugs and serious security vulnerabilities.

### Why Quoting Matters
Consider this example where a filename contains a space:

```bash
#!/bin/bash

filename="my file.txt"

# WRONG - Bash splits this into two words: "my" and "file.txt"
touch $filename    # Creates two separate files: "my" and "file.txt"

# CORRECT - The quotes preserve the value as a single argument
touch "$filename"  # Creates exactly one file: "my file.txt"
```

If a variable contains spaces, wildcards (`*`, `?`), or other special characters, Bash will interpret them rather than treating the value as a single string unless it is properly quoted.

> 💡 **Rule of Thumb:** Always use double quotes around variables: `"$name"`, not `$name`. The only common exception is inside `[[ ]]` test brackets, where word splitting does not occur, but even there, quoting remains an excellent practice.

---

## 3. When to Use Curly Braces

You can also wrap the variable name in curly braces: `${name}`. This is strictly required when the variable name is immediately followed by characters that could be misinterpreted as part of the variable name itself.

```bash
greeting="Hello"

# WITHOUT BRACES: Bash looks for a variable named $greetings (which doesn't exist)
echo "$greetings world"   # Prints: " world"

# WITH BRACES: Bash explicitly knows the variable name is "greeting"
echo "${greeting}s world" # Prints: "Hellos world"
```

### Other Uses for Curly Braces
Curly braces are also mandatory for more advanced operations, including:
* **Arrays:** `${array[0]}`
* **String slicing:** `${name:0:3}`
* **Default values:** `${name:-default}`

*Note: For simple cases like `echo "$name"`, the braces are optional. Both `"$name"` and `${name}"` behave identically.*

---

## 4. Using Variables in a Script

Let's look at a practical implementation inside a script named `devdojo.sh`.

```bash
#!/bin/bash

name="DevDojo"

echo "Hi there $name"
```

### Execution
Run the file in your terminal:
```bash
chmod +x devdojo.sh
./devdojo.sh
```

**Output:**
```text
Hi there DevDojo
```

### Code Breakdown
1. `#!/bin/bash` - The Shebang line specifying the interpreter path.
2. `name="DevDojo"` - Declares a variable named `name` and assigns a string value.
3. `echo "Hi there $name"` - Outputs the string concatenated with the variable's value.

### Multiple Variables
You can specify multiple variables consecutively. Note that semicolons (`;`) are optional at the end of lines!

```bash
#!/bin/bash

name="DevDojo"
greeting="Hello"

echo "$greeting $name"
```

**Output:**
```text
Hello DevDojo
```

---

## 5. Command-Line Arguments (Positional Parameters)

Variables can also be passed into scripts externally from the command line as positional arguments.

### Example Execution
```bash
./devdojo.sh Bobby buddy!
```

In this example, the script takes two parameters (`Bobby` and `buddy!`) separated by a space.

### Reading Parameters inside the Script
Inside your script, parameters are mapped to numeric variables based on their order (`$1`, `$2`, etc.). You can also use `$@` to access all parameters at once.

```bash
#!/bin/bash

# $1 holds the first parameter
echo "Hello there $1"

# $2 holds the second parameter
echo "Hello there $2"

# $@ holds all parameters passed to the script
echo "Hello there $@"
```

### Final Output
Running `./devdojo.sh Bobby buddy!` with the script above yields:

```text
Hello there Bobby
Hello there buddy!
Hello there Bobby buddy!
```
