## 🟠 Level 8: Advanced Arithmetic Loops & Tracking

### Challenge 22: The High-Five Counter (`while`)
**Goal:** Use a math variable to control a loop sequence.
* Set a variable `counter=1`.
* Use a `while [ $counter -le 5 ]` loop to print `"High Five #$counter! 🖐️"`.
* Increment the counter inside the loop using the arithmetic double-bubble `(( counter++ ))`.

### Challenge 23: The Countdown Timer
**Goal:** Count backward down to zero.
* Set a variable `timer=10`.
* Build a loop that prints the timer value, then subtracts 1 using `(( timer-- ))`.
* When it hits 0, print `"🚀 BLAST OFF!"`

### Challenge 24: The Dynamic Multiplier Table
**Goal:** Build a custom multiplication table line.
* Take a base number as the first terminal argument (`$1`).
* Create a variable `multiplier=5`.
* Calculate the product inside `(( ))`.
* Print out the neat math equation format: `"X times Y equals Z"`.

---

## 🔴 Level 9: File System & Path Mastery

### Challenge 25: The Directory Guard (`-d`)
**Goal:** Check if a folder directory exists before touching it.
* Create a variable `backup_folder="my_backups"`.
* Use an `if [ ! -d "$backup_folder" ]` statement to check if it does NOT exist.
* Inside the `then` block, make the folder automatically using `mkdir`.

### Challenge 26: The Backup File Timer
**Goal:** Combine text strings with variables to create a timestamped file name.
* Create a variable `project="website"`.
* Create a variable `version=2`.
* Combine them to create a filename variable: `filename="${project}_v${version}.tar.gz"`.
* Print out the final production name.

### Challenge 27: The PATH Cleaner
**Goal:** Safely display all your executable path options cleanly on separate lines.
* Take the built-in system variable `$PATH`.
* Use a text replacement trick or a loop to replace the colons `:` with clear new lines.
* Print out your system’s searching roadmap clearly!

---
