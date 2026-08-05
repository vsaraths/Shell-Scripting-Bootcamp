## 🟠 Level 13: File Reading & Text Splitting

### Challenge 41: The Empty String Emergency
**Goal:** Check for multiple empty inputs at the same time.
* Take two arguments from the command line (`$1` and `$2`).
* Use a conditional check to see if *either* argument is missing (`-z` operator combined with `||` for OR).
* Print a clear missing parameter warning block if true.

---

### Challenge 42: The Configuration Loader
**Goal:** Read a single line from a text file into a live script variable.
* Manually create a tiny file named `host.txt` containing just the word `production-server`.
* Write a script that uses `read -r active_host < host.txt` to pull that text inside a variable box.
* Print: `"Target configuration environment loaded: $active_host"`.

### Challenge 43: The Secret Phrase Extracted
**Goal:** Isolate and count specific words within a multi-layered string variable.
* Create a variable text layout: `sentence="Automate everything everywhere every day"`.
* Use a string substitution method to count how many times the letters `"every"` appear.

### Challenge 44: Upper and Lower Case Transformers
**Goal:** Force a text variable to completely change its casing natively.
* Create a lowercase variable: `tool="ansible"`.
* Use the native Bash uppercase transformer syntax `${tool^^}` to make it loud.
* Create an uppercase variable: `CLOUD="AWS"`.
* Use the lowercase transformer syntax `${CLOUD,,}` to make it quiet, and print both.

---
