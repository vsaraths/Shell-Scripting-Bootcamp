# 🏁 Day 3: Variable Challenge Arena - Solution Manual

This document contains the official answers, explanations, and expected
outputs for all 15 Day 3 challenges. Use this to verify your scripts and
learn the mechanics behind the code!

------------------------------------------------------------------------

# 🟢 Level 1: The Basics

## Challenge 1: The Backpack Setup

### Script (`backpack.sh`)

``` bash
#!/bin/bash
item1="Book"
item2="Pencil"

echo "Inside my backpack, I have a $item1 and a $item2!"

# Updating the variable
item2="玩具 (Toy)"
echo "Inside my backpack, I have a $item1 and a $item2!"
```

### Expected Output

``` text
Inside my backpack, I have a Book and a Pencil!
Inside my backpack, I have a Book and a 玩具 (Toy)!
```

------------------------------------------------------------------------

## Challenge 2: The Identity Badge

### Script (`badge.sh`)

``` bash
#!/bin/bash
first_name="Sarath"
last_name="Kumar"
role="SPELLCASTER"

echo "${role}: ${first_name} ${last_name}"
```

### Expected Output

``` text
SPELLCASTER: Sarath Kumar
```

------------------------------------------------------------------------

## Challenge 3: Fast Food Order

### Script (`order.sh`)

``` bash
#!/bin/bash
order="Burger 🍔"
echo "Current Order: $order"

order="$order + Fries 🍟"
echo "Current Order: $order"

order="$order + Soda 🥤"
echo "Final Feast: $order"
```

### Expected Output

``` text
Current Order: Burger 🍔
Current Order: Burger 🍔 + Fries 🍟
Final Feast: Burger 🍔 + Fries 🍟 + Soda 🥤
```

------------------------------------------------------------------------

# 🟡 Level 2: The Sneaky Quirks

## Challenge 4: The Space Trap

``` bash
#!/bin/bash
# INTENTIONAL ERROR FOR LEARNING:
pet = "Cat"

# Explanation: Bash thinks "pet" is a command and tries to pass "=" and "Cat" to it.
```

### Expected Error

``` text
./space_trap.sh: line 3: pet: command not found
```

------------------------------------------------------------------------

## Challenge 5: The Double-Quote Shield

``` bash
#!/bin/bash
playlist="LoFi Beats For Coding"

echo "Listening to: \"$playlist\""
```

### Expected Output

``` text
Listening to: "LoFi Beats For Coding"
```

------------------------------------------------------------------------

## Challenge 6: The Ghost Hunter

``` bash
#!/bin/bash
filled_box="Treasure 💎"

echo "Opening the filled box: $filled_box"
echo "Opening the empty box: $empty_box"
```

### Expected Output

``` text
Opening the filled box: Treasure 💎
Opening the empty box:
```

------------------------------------------------------------------------

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
