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
