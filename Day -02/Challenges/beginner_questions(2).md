# Beginner Questions

🟢 Beginner (Challenges 2.1 – 2.10)
Challenge 2.1: Write a script backpack.sh that declares variable ITEM="Laptop", prints it, reassigns ITEM="Camera", and prints the updated value.

Challenge 2.2: Write a script badge.sh that takes two variables FIRST_NAME="Varivettuchalil" and LAST_NAME="Sarath" and concatenates them cleanly into a single output string using ${FIRST_NAME} ${LAST_NAME}.

Challenge 2.3: Write a script order.sh that initializes ORDER="Coffee", appends " and Croissant" to it using self-referential assignment (ORDER="${ORDER} and Croissant"), and prints the final order.

Challenge 2.4: Demonstrate the space syntax trap: show why VAR = "value" throws a command not found error, while VAR="value" executes correctly.

Challenge 2.5: Compare double quote vs single quote variable expansion: demonstrate why echo "Hello $USER" expands $USER, whereas echo 'Hello $USER' prints the literal string $USER.

Challenge 2.6: Demonstrate empty variable behavior: declare an unassigned variable GHOST="" or reference an unset variable $UNSET_VAR, and print "Ghost value: [${GHOST}]" safely.

Challenge 2.7: Assign an integer PORT=8080 to a variable, update it to 8081, and print "Updated Port: ${PORT}".

Challenge 2.8: Use command substitution TODAY=$(date +%Y-%m-%d) to store the current date string in a variable and print it.

Challenge 2.9: Demonstrate variable scoping with braces: print ${VAR}suffix to prevent Bash from looking for a non-existent variable $VARsuffix.

Challenge 2.10: Declare a variable containing spaces LOG_MSG="System boot sequence initiated", and demonstrate why wrapping it in double quotes "${LOG_MSG}" prevents word splitting.