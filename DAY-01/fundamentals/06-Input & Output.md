## Imagine you are playing with a Walkie-Talkie.

* INPUT: When you hold down the button and listen to your friend shouting "Basecamp is clear!", data is entering your ears. Your friend is giving your brain information.
* OUTPUT: When you press the button and speak into the microphone saying "Roger that, moving in!", you are sending information out into the air for your friend to hear.

If the walkie-talkie only let you listen but never speak (or speak but never listen), it would be broken and useless. Communication must go both ways!

## 📖 2. The Definition
Input and Output (I/O) is how a script interacts with the outside world.
Input is the process of a program reading external data—whether it's a user typing keys on a keyboard, a configuration file being read, or data being fetched from a cloud API.
Output is the process of the program displaying information back to the screen (echo), writing text out into a log file, or sending data across the network.

## 💻 3. DevOps Code Example
DevOps engineers write interactive scripts that safety-check hazardous tasks (like deleting database assets) by demanding explicit user input before outputting the results:

Bash
```#!/bin/bash

# 1. OUTPUT: Print a warning warning out to the engineer's terminal screen
echo "⚠️ WARNING: You are about to wipe the production database cache!"
echo -n "Type 'YES' to confirm and proceed: "

# 2. INPUT: The 'read' command pauses the script and waits for the user to type text
read USER_CONFIRMATION

# 3. Dynamic Decision Flow (Day 3 Conditional logic!)
if [ "$USER_CONFIRMATION" == "YES" ]; then
    # OUTPUT: If they typed YES, print the success message
    echo "🚀 Deleting database cache now..."
    # (Real drop/wipe commands would execute here)
    echo "✅ Success: Database cache wiped clean."
else
    # OUTPUT: If they typed anything else, abort safely
    echo "❌ Execution Aborted. No changes were made to the system."
    exit 1
fi
```
## ⚠️ 4. The Rule / Condition / Constraints
* When capturing user string inputs via the read command, users will occasionally type unexpected trailing spaces or use unpredictable lowercase letters (e.g., typing "yes " or "Yes" instead of a strict uppercase "YES").
* To write bulletproof DevOps scripts, you must wrap your input strings in strict double-quotes inside your conditions—like "$USER_CONFIRMATION"—to prevent Bash syntax errors if the user accidentally hits the Enter key without typing anything at all!
