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
