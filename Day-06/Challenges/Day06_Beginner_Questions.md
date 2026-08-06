📋 QUESTIONS (Day 06: Challenges 6.1 -- 6.35)🟢 Beginner (Challenges 6.1
-- 6.10)Challenge 6.1: Run a command (e.g., ls /valid_path), capture its
exit status into a variable status=\$?, and use if (( status != 0 )) to
print "Command failed" or "Command succeeded".Challenge 6.2: Write a
random server router script that uses \$(( RANDOM % 3 + 1 )) to pick a
random server index (1, 2, or 3) and print "Routing traffic to Server
\$index".Challenge 6.3: Check a disk usage percentage variable
disk_used=85. If (( disk_used \> 80 )), print a \[WARNING\] Disk usage
high! alert.Challenge 6.4: Write an input guard at the top of a script
that checks if no arguments were passed ((( \$# == 0 ))) and exits with
status 1 while printing a usage message.Challenge 6.5: Parse a
comma-separated string servers="node1,node2,node3" using IFS="," in a
loop and print each node on a new line.Challenge 6.6: Given a
configuration file line DB_HOST=localhost, use parameter expansion
${line#*=} to extract the value after the = sign (localhost).Challenge 6.7: Lock a deployment environment variable using readonly DEPLOY_ENV="production". Demonstrate what happens when you attempt to modify it later in the script.Challenge 6.8: Write an exit status check that tests if mkdir /tmp/test_dir succeeded ($?
== 0) before attempting to cd into it.Challenge 6.9: Validate that a
script receives exactly 2 arguments using if (( \$# != 2 )). Print an
error and exit with status 2 if the condition fails.Challenge 6.10:
Generate a random port number between 8000 and 8099 using \$RANDOM and
print the assigned port.
