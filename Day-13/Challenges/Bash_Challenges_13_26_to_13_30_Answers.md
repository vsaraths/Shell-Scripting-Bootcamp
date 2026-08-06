# Bash Scripting Challenges 13.26–13.30 - Answers

## 💡 Answer 13.26
```bash
awk '
{
  total_bytes += $10
  total_time += $11
  count++
  if ($9 ~ /^5/) errors_5xx++
}
END {
  printf "========================================\n"
  printf "       NGINX KPI SUMMARY REPORT\n"
  printf "========================================\n"
  printf "Total Requests Served  : %d\n", count
  printf "Total Bandwidth Served : %.2f KB\n", total_bytes/1024
  printf "Total 5xx Server Errors: %d\n", errors_5xx
  printf "Avg Response Latency   : %.4f sec\n", (count?total_time/count:0)
  printf "========================================\n"
}' nginx_access.log
```

**Explanation**
- `$10` = bytes served
- `$11` = response time
- `$9 ~ /^5/` counts 5xx errors

---

## 💡 Answer 13.27
```bash
sed -i -E \
-e 's/[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/masked_user@staging.local/g' \
-e 's/'\''[0-9]{16}'\''/'\''XXXX-XXXX-XXXX-XXXX'\''/g' \
production_dump.sql
```

**Explanation**
- `-i` edits in-place.
- `-E` enables extended regex.
- `-e` chains multiple substitutions.

---

## 💡 Answer 13.28
```bash
awk -F'=' '
NR==FNR{
  if($1!~/^#/ && $1!="") dev_keys[$1]=1
  next
}
{
  if($1 in dev_keys) delete dev_keys[$1]
}
END{
  print "--- CONFIG DRIFT: KEYS MISSING IN PROD ---"
  for(key in dev_keys)
    print "Missing Key:", key
}' dev.env prod.env
```

**Explanation**
- `NR==FNR` processes the first file.
- Uses an associative array to compare keys.

---

## 💡 Answer 13.29
```bash
awk '
{
  for(i=1;i<=NF;i++){
    if($i~/^TIMESTAMP=/) split($i,t,"=")
    if($i~/^txn_id=/) split($i,id,"=")
    if($i~/^EVENT=/) split($i,ev,"=")
  }
  if(ev[2]=="TRANSACTION_START")
    start[id[2]]=t[2]
  else if(ev[2]=="TRANSACTION_END")
    printf "Transaction ID: %s | Duration: %d sec\n", id[2], t[2]-start[id[2]]
}' transactions.log
```

**Explanation**
- Stores start time by transaction ID.
- Subtracts end and start timestamps.

---

## 💡 Answer 13.30
```bash
sed -i '/name: api-container/,/image:/ s/image: myapp:v1.0.0/image: myapp:v2.1.0/' deployment.yaml
```

**Explanation**
- Limits the replacement to the `api-container` block.
- Updates only the matching image.

---

## 🎯 Day 13 Complete!
You have completed all 30 challenges for **Day 13: Advanced Text Processing with AWK & SED**.
