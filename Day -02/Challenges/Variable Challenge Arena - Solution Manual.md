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
