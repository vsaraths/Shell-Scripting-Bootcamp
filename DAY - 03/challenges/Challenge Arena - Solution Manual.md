# 🟠 Level 3: Dynamic Inputs

## Challenge 7: The Greeting Blender

``` bash
#!/bin/bash
echo "Hello, $1! Welcome to our GitHub repository!"
```

**Execution**
you need to pass the argument like this
``` bash
./greet_me.sh Sarath
```

### Expected Output

``` text
Hello, Sarath! Welcome to our GitHub repository!
```

------------------------------------------------------------------------

## Challenge 8: The Dynamic Duo

``` bash
#!/bin/bash
echo "${1} cannot save the day without the help of ${2}!"
```

**Execution**

``` bash
./duo.sh Batman Robin
```

### Expected Output

``` text
Batman cannot save the day without the help of Robin!
```

------------------------------------------------------------------------

## Challenge 9: The Ultimate Party Guest List

``` bash
#!/bin/bash
echo "Tonight's VIP guests are: $@"
```

**Execution**

``` bash
./party.sh Alex Bobby Charlie
```

### Expected Output

``` text
Tonight's VIP guests are: Alex Bobby Charlie
```

------------------------------------------------------------------------

# 🔴 Level 4: The Calculator Double-Bubble

## Challenge 10: The Level Up Counter

``` bash
#!/bin/bash
current_level=1

(( current_level = current_level + 1 ))
echo "Congratulations! You reached level: $current_level"
```

### Expected Output

``` text
Congratulations! You reached level: 2
```

------------------------------------------------------------------------

## Challenge 11: The Multiplier

``` bash
#!/bin/bash
(( result = $1 * 2 ))
echo "Your doubled number is: $result"
```

**Execution**

``` bash
./multiply.sh 25
```

### Expected Output

``` text
Your doubled number is: 50
```

------------------------------------------------------------------------

## Challenge 12: The Score Splitter

``` bash
#!/bin/bash
total_loot=100
(( split_loot = total_loot / 4 ))

echo "Each player receives: $split_loot gold coins 🪙"
```

### Expected Output

``` text
Each player receives: 25 gold coins 🪙
```

------------------------------------------------------------------------

# ⚡ Level 5: Smart Variables

## Challenge 13: The Magic Dice Match

``` bash
#!/bin/bash
guess=$1
(( target = RANDOM % 5 ))

echo "Target was: $target | Your guess: $guess"

if (( guess == target )); then
    echo "🎉 Match! You are a mind reader!"
else
    echo "🔮 No match. The dice rolled differently!"
fi
```

------------------------------------------------------------------------

## Challenge 14: The File Detective

``` bash
#!/bin/bash
my_file="backpack.sh"

if [ -f "$my_file" ]; then
    echo "🔍 File Status: Found '$my_file' safely in this directory!"
else
    echo "⚠️ File Status: '$my_file' does not exist here!"
fi
```

------------------------------------------------------------------------

## Challenge 15: The Ultimate Wizard Exam

``` bash
#!/bin/bash

user_name="$1"
birth_year=$2

if [ -z "$user_name" ] || [ -z "$birth_year" ]; then
    echo "Usage: $0 [Name] [Birth Year]"
    exit 1
fi

(( age = 2026 - birth_year ))

echo "Hello, $user_name!"
echo "According to my calculations, you are $age years old."

if (( age >= 18 )); then
    echo "🧙‍♂️ Access Granted: Welcome Professional DevOps Engineer!"
else
    echo "🌱 Access Granted: Welcome Apprentice! Keep learning!"
fi
```
### Positional Parameters: `$0`, `$1`, and `$2`

In Bash scripting, these special built-in variables are automatically populated by the system based on what the user types in the terminal.

*   **`$0`**: Represents the **name (or path) of the script itself** that is currently running (the "zeroth" argument).
*   **`$1`**: Represents the **first argument** typed after the script name (in this case, the `Name`).
*   **`$2`**: Represents the **second argument** typed after the script name (in this case, the `Birth Year`).

#### Visual Breakdown:
If you execute a script by typing:
`./wizard2.sh sarath 1995`

*   `$0` becomes `./wizard2.sh`
*   `$1` becomes `sarath`
*   `$2` becomes `1995`

### 1. The Condition: `if [ -z "$user_name" ] || [ -z "$birth_year" ]; then`

*   **`-z`**: This is a special Bash flag that stands for **"zero length"**. It checks if a variable is completely empty (blank).
*   **`[ -z "$user_name" ]`**: This asks: *"Is the `user_name` variable empty?"*
*   **`||`**: This is the logical **OR** operator.
*   **`[ -z "$birth_year" ]`**: This asks: *"Is the `birth_year` variable empty?"*

**In plain English:** 
> *"If the name is missing **OR** the birth year is missing, then execute the following block of code..."*

**Execution**

``` bash
./wizard_exam.sh Sarath 1995
```

### Expected Output

``` text
Hello, Sarath!
According to my calculations, you are 31 years old.
🧙‍♂️ Access Granted: Welcome Professional DevOps Engineer!
```
