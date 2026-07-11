# 🏆 Day 3: The Ultimate Variable Challenge Arena (15 Progressive Quests)

Welcome to the Arena! This workbook takes you from an absolute beginner to a confident Bash script builder. 

For each challenge, create the script file, write your magic spell, run it in your terminal, and observe the results!

---

## 🟢 Level 1: The Basics (Putting Things in Boxes)

### Challenge 1: The Backpack Setup (Your Homework!)
**Goal:** Create a script named `backpack.sh` that stores your school supplies and changes them mid-flight.
* Create a variable `item1` and assign it the value `"Book"`.
* Create a variable `item2` and assign it the value `"Pencil"`.
* Print: `"Inside my backpack, I have a Book and a Pencil!"` using your variables.
* Change `item2` to `"玩具 (Toy)"`.
* Print the sentence again to show the update!

### Challenge 2: The Identity Badge
**Goal:** Learn how to combine text boxes together.
* Create three variables: `first_name`, `last_name`, and `role`.
* Combine them into a single phrase and use `echo` to print out a badge like: `"SPELLCASTER: [First Name] [Last Name]"`.

### Challenge 3: Fast Food Order
**Goal:** Practice updating variables one after the other.
* Create a variable called `order` and set it to `"Burger 🍔"`. Print it.
* On the next line, change `order` to `"Burger 🍔 + Fries 🍟"`. Print it.
* On the next line, change `order` to `"Burger 🍔 + Fries 🍟 + Soda 🥤"`. Print the final feast!

---

## 🟡 Level 2: The Sneaky Quirks (Spaces and Traps)

### Challenge 4: The Space Trap
**Goal:** Prove you know the Golden Rule of Bash spaces.
* Write a script that intentionally breaks by putting spaces around the `=` sign (e.g., `pet = "Cat"`). 
* Run it, look at the error message, and write a comment `#` explaining *why* it broke so your community understands!

### Challenge 5: The Double-Quote Shield
**Goal:** Protect a variable containing spaces.
* Create a variable `playlist="LoFi Beats For Coding"`.
* Try to use it in a command or sentence without quotes, and then with quotes. 
* Add a comment explaining why the "Safety Jacket" (quotes) protects your text phrases.

### Challenge 6: The Ghost Hunter
**Goal:** See what happens when a box is completely empty.
* Create a variable named `filled_box="Treasure 💎"`.
* Write an `echo` statement trying to print `$filled_box` AND an imaginary variable called `$empty_box`.
* Run it to observe how Bash gracefully handles missing boxes without crashing!

---

## 🟠 Level 3: Dynamic Inputs (The Blender Arguments)

### Challenge 7: The Greeting Blender
**Goal:** Pass your name into a script from the outside terminal.
* Create a script called `greet_me.sh`.
* Use the special parameter `$1` to capture the name you type when running the script.
* Print: `"Hello, $1! Welcome to our GitHub repository!"`

### Challenge 8: The Dynamic Duo
**Goal:** Pass two separate ingredients into a script.
* Create a script that takes a hero name as `$1` and a sidekick name as `$2`.
* Print: `"${1} cannot save the day without the help of ${2}!"` (Hint: Remember your hugging braces `{ }`!).

### Challenge 9: The Ultimate Party Guest List
**Goal:** Capture *everything* passed into the script at once.
* Create a script that uses the magic `$@` shortcut to capture an entire list of names typed in the terminal.
* Print out: `"Tonight's VIP guests are: $@"`.

---

## 🔴 Level 4: The Calculator Double-Bubble (`(( ))`)

### Challenge 10: The Level Up Counter
**Goal:** Perform basic addition inside the math bubble.
* Create a variable `current_level=1`.
* Use the double-bubble syntax `(( current_level = current_level + 1 ))` to level up.
* Print out your new level status.

### Challenge 11: The Multiplier
**Goal:** Take a number from the user and double it.
* Create a script that takes a number as an outside argument (`$1`).
* Inside the math bubble, multiply it by 2.
* Print out the result.

### Challenge 12: The Score Splitter
**Goal:** Do division inside a script.
* Set a variable `total_loot=100`.
* Divide the loot equally between `4` players using the `(( ))` syntax.
* Print how much loot each player gets.

---

## ⚡ Level 5: Smart Variables (Decisions & System Secrets)

### Challenge 13: The Magic Dice Match
**Goal:** Check if a random number matches your guess.
* Take a number guess from the outside terminal (`$1`).
* Grab a small random number using this exact math formula: `(( target = $RANDOM % 5 ))`.
* Use an `if` statement to check if your guess `==` the target!

### Challenge 14: The File Detective
**Goal:** Check if a file name variable actually exists on your computer.
* Create a variable `my_file="backpack.sh"`.
* Use an `if [ -f "$my_file" ]` statement to print a message confirming if the file exists or if it's missing.

### Challenge 15: The Ultimate Wizard Exam
**Goal:** Bring every single skill from Days 1–4 together!
* Create a script that takes your **Name** (`$1`) and your **Birth Year** (`$2`).
* Store them in descriptive variable boxes.
* Use the math bubble `(( ))` to subtract your birth year from `2026` to calculate your age.
* Use an `if/else` statement: If your calculated age is greater than or equal to 18, print a "Welcome Professional" message. Otherwise, print an "Amateur Apprentice" message!

---

## 🏁 How to Show Off Your Work
Once you complete these challenges, commit your scripts to your GitHub repository:
```bash
git add .
git commit -m "Completed all 15 Day 4 variable challenges! 🚀"
git push
