**Let’s zoom in on Data Types and break them down. If variables are labeled boxes, Data Types tell the computer what kind of object is inside the box so it doesn't try to use it the wrong way.
Think of it like sorting items in your house. You can wash clothes in a washing machine, and you can bake food in an oven. But if you try to bake your socks in the oven or put a raw chicken in the washing machine, everything breaks!
In programming, data types stop the computer from making those silly mistakes. **

**Let’s look at the three core types using everyday examples:

#1: Strings (The Text)
Example
Imagine you have a label maker. You print out the word "SARATH" and stick it on your laptop. That label doesn't do anything; it's just a name you read. If you try to add the text label "SARATH" to another text label "MALAYALAM", you don't get a new math answer; you just get two words sitting next to each other.

##📖 The Definition
A String is a sequence of text characters (letters, symbols, spaces, or even numbers) wrapped inside quotation marks. The computer treats strings strictly as static text to be printed or read, never as mathematical digits.

###💻 DevOps Code Example
Markdown
<div><strong>💻 Terminal</strong></div>

```bash
# Storing text into variables using double quotes
SERVER_NAME="web-prod-server-01"
LOG_DIR="/var/log/nginx"
```
Markdown
<div><strong>💻 Terminal</strong></div>

```bash
echo "Connecting to $SERVER_NAME to inspect logs in $LOG_DIR"
```

#⚠️ The Rule / Condition
**If you put quotation marks around a number, it becomes a string.

AGE=30 is a number you can do math with.

AGE="30" is text. If you try to perform calculation commands on "30", Bash will treat it like you are trying to add the word "apple" to a number and throw an error. Always wrap text in quotes, and keep math numbers clean!

# 2: Integers (The Numbers)
Example
Imagine you have a stack of green Lego bricks. You count them out loud: 1, 2, 3, 4, 5. If you add 2 more physical bricks to your stack, you can instantly count them again and see that you now have 7 bricks. They are objects you can physically calculate, stack up, or take away.

##📖 The Definition
An Integer is a whole number (positive, negative, or zero) written without any quotation marks. This tells the system's memory that the value is a numeric digit available for mathematical computations, logical comparisons, and counting operations.

###💻 DevOps Code Example
Markdown
<div><strong>💻 Terminal</strong></div>

```bash
# Storing integers without quotes
TOTAL_SERVERS=5
FAILED_SERVERS=2
```
Markdown
<div><strong>💻 Terminal</strong></div>

```bash
# Performing basic Bash math using the $(( )) syntax
RUNNING_SERVERS=$(( TOTAL_SERVERS - FAILED_SERVERS ))

echo "Healthy running servers remaining: $RUNNING_SERVERS"
```
#⚠️ The Rule / Condition
Bash cannot naturally handle decimals (floating-point numbers like 3.5 or 99.9). If you attempt to run COST=10.5 and use it in standard Bash math loops, the script will crash. Bash integers must always be clean, whole numbers.

##3: Booleans (The Binary Switch)
Example
Think of the main light switch in your bedroom. The switch only has two choices: it is either completely ON or completely OFF. There is no third option, and it cannot be half-on. It tells you the absolute truth about whether the light is working.

###📖 The Definition
A Boolean represents a binary logic state: it is either True or False. It is the ultimate checkpoint programs use to see if a specific requirement has been successfully met.

###💻 DevOps Code Example
In standard programming languages, you write True or False. However, Linux and Bash use Exit Status Codes to represent this switch:
Markdown
<div><strong>💻 Terminal</strong></div>

```bash
0 = Success / True (Zero errors occurred!)

1 or higher = Failure / False (Something broke!)
```
Markdown
<div><strong>💻 Terminal</strong></div>

```bash
# Run a quick ping check to see if a website is alive
ping -c 1 google.com > /dev/null
```

# Linux stores the boolean result in a special system variable called $?
EXIT_STATUS=$?
Markdown
<div><strong>💻 </strong></div>

```bash
# If the exit status is 0, it means True (success)
if [ $EXIT_STATUS -eq 0 ]; then
    echo "The internet connection is TRUE (Working)."
else
    echo "The internet connection is FALSE (Broken)."
fi
```
⚠️ The Rule / Condition
Every single Linux terminal command you run will instantly overwrite the $? system box with its own exit status code. If you want to check if a specific command succeeded, you must evaluate or save $? immediately on the very next line of your script before running anything else!

This four-step structure gives you the structural framework for every block in your new fundamentals.md guide. Since you have this file open on your GitHub interface right now, go ahead and paste this section directly underneath your introductory titles. Let me know when it is committed!
