# Bash Redirection Challenges 11.1--11.15 Answers

## 💡 ANSWERS & EXPLANATIONS

``` bash
# 11.1
ls -l > directory_contents.txt

# 11.2
date >> system_events.log

# 11.3
ls /valid_dir /invalid_dir 2> error.log

# 11.4
tar -czvf backup.tar.gz /data &> backup.log

# 11.5
find / -name "app.conf" 2>/dev/null

# 11.6
wc -l < access.log

# 11.7
cat <<EOF > config.env
PORT=8080
DB_HOST=localhost
EOF

# 11.8
text="devops"
tr 'a-z' 'A-Z' <<< "$text"

# 11.9
cat process.txt | grep "nginx" | wc -l

# 11.10
uptime | tee uptime_history.txt

# 11.11
date | tee -a history.log

# 11.12
while read -r line; do
  echo "Pinging host: $line"
done < servers.txt

# 11.13
exec 3>custom.log
echo "Line 1" >&3
echo "Line 2" >&3
exec 3>&-

# 11.14
diff <(sort file1.log) <(sort file2.log)

# 11.15
command 3>&1 1>error.log 2>&3 3>&-
```
