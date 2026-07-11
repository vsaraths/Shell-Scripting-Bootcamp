# 🏆 Day 3: The Ultimate Variable Challenge Arena (Volume 2)

Ready for more? This volume pushes your skills even further. You will handle interactive text, system configurations, loop counters, and advanced text isolation. 

Create your files, write your code, and let's get your hands dirty!

---

## 🟢 Level 6: User Interaction & Dynamic Echoes

### Challenge 16: The Teleporter Prompt (`read`)
**Goal:** Learn how to pause a script and wait for a user to type an answer.
* Create a script that asks the user: `"Where do you want to teleport today?"`
* Use the `read` command to capture their answer into a variable named `destination`.
* Print out: `"✨ Teleporting you safely to $destination... Zoom!"`

### Challenge 17: Secret Passcode Input (`read -s`)
**Goal:** Capture sensitive input without showing it on the screen.
* Write a script that asks the user to type a secret key.
* Use `read -s password` so their typing stays completely hidden.
* Print a message afterward saying: `"🔒 Password recorded safely in our variable box!"`

### Challenge 18: Default Value Rescue (`:-`)
**Goal:** Use a fallback option if a variable box turns out to be empty.
* Create a script that reads a variable `user_theme`.
* Use the fallback syntax `${user_theme:-Dark Mode}` to print the theme.
* Test it by leaving `user_theme` empty, then test it by giving it a value like `"Cyberpunk"`.

---

## 🟡 Level 7: String Length & Slicing Magic

### Challenge 19: The Word Length Counter (`${#}`)
**Goal:** Find out exactly how many characters are inside a variable box.
* Create a variable `secret_word="Supercalifragilisticexpialidocious"`.
* Use the character length syntax `${#secret_word}` to count the letters.
* Print out: `"That word is exactly X characters long!"`

### Challenge 20: The Text Slicer (`${::}`)
**Goal:** Cut a variable string and pull out only a tiny piece of it.
* Create a variable `long_date="2026-07-11"`.
* Use the slicing syntax `${long_date:0:4}` to isolate just the year.
* Print out: `"The year extracted from the date is: $year"`.

### Challenge 21: The Nickname Generator
**Goal:** Slice the first 3 letters of any name passed into the script.
* Take a name from the outside terminal argument (`$1`).
* Slice the first three letters out of it.
* Print out: `"Your gaming nickname is: [Sliced Text]... Go get 'em!"`

---

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

## ⚡ Level 10: Intermediate DevOps & System Engineering SIMs

### Challenge 28: The Exit Code Guard
**Goal:** Catch mistakes immediately using the `$?` status tracker.
* Attempt to create a folder in a restricted area: `mkdir /protected_folder_xyz 2> /dev/null`.
* Immediately capture the exit code into a variable: `status=$?`.
* Use an `if` statement: If `status` is not equal to 0, print `"⚠️ Access Denied: You do not have permissions!"`

### Challenge 29: The Random Server Picker
**Goal:** Use a randomizer variable to assign traffic to different server strings.
* Roll a dice: `(( choice = $RANDOM % 3 + 1 ))`.
* Use `if/elif/else` to match the number. If 1, assign `server="prod-server-01"`. If 2, assign `server="prod-server-02"`, etc.
* Print out: `"Routing internet traffic dynamically to: $server"`.

### Challenge 30: The Storage Space Warning
**Goal:** Track disk usage metrics inside variables.
* Create a mock variable simulating disk space: `disk_used=87`.
* Write an engineering check: If `disk_used` is greater than 80, print `"🚨 WARNING: Disk utilization is critical at $disk_used%!"`

### Challenge 31: The Parameter Count Check (`$#`)
**Goal:** Prevent a script from running if the user forgets to supply inputs.
* Use the built-in variable `$#` to check how many arguments were typed.
* If `$#` is equal to 0, print `"❌ Error: This script requires at least 1 input argument to run!"` and exit.

### Challenge 32: The Custom Word Splitter (`IFS`)
**Goal:** Break a single comma-separated text variable into individual clean items.
* Create a variable `skills="Linux,Docker,AWS,Ansible"`.
* Temporarily change the Internal Field Separator (`IFS=","`).
* Run a loop over the variable to print each automation skill on its own line.

### Challenge 33: The Config Value Finder
**Goal:** Simulating extraction of data values from environment strings.
* Set a variable line text: `config_line="DB_PORT=5432"`.
* Use Bash string manipulation to strip away everything before the `=` sign.
* Print out: `"The database port number found is: $port"`.

### Challenge 34: The Read-Only Lockdown
**Goal:** Create an absolute unchangeable anchor configuration variable.
* Declare a system parameter variable using the `readonly` command (e.g., `readonly DEVOPS_ZONE="Production"`).
* Intentionally try to change it on the next line to `"Staging"`.
* Observe the system's lock down behavior to protect structural variables.

### Challenge 35: The Grandmaster Shell Deployment Dashboard
**Goal:** The Final Exam! Combine user input, path metrics, loops, math, and system variables together.
* Ask the user for their preferred deployment name using `read`.
* Generate a random server ID number using `$RANDOM`.
* Check if a text file configuration exists in the directory.
* Print out a unified deployment summary report showing the `$USER`, the `$HOSTNAME`, the target server, and the exact `$LINENO` reached at completion!
