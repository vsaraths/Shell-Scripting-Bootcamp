# Bash Scripting Challenges 13.16–13.25 - Answers

## 13.16
```bash
awk -F'[,:]' '{print "Host:", $1, "Memory:", $5}' metrics.csv
```
- `-F'[,:]'` splits on commas and colons.
- `$1` = hostname.
- `$5` = memory usage.

---

## 13.17
```bash
sed '/^#/!s/ENVIRONMENT=staging/ENVIRONMENT=production/' deploy.sh
```
- `!` applies substitution only to non-comment lines.

---

## 13.18
```bash
sed -E 's/([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+):([0-9]+)/HOST=\1 PORT=\2/' services.txt
```
- `\1` = IP address.
- `\2` = Port.

---

## 13.19
```bash
awk '{
  code=substr($3,1,1)"xx"
  sub(/ms/,"",$4)
  sum[code]+=$4
  count[code]++
}
END{
  for(c in sum)
    printf "Category %s Avg Latency: %.2fms\n",c,sum[c]/count[c]
}' access.log
```

---

## 13.20
```bash
sed -E 's/"([^"]+)": "([^"]+)",?/\1 = \2/' raw.txt
```

---

## 13.21
```bash
sed -n '/--- BEGIN DEPLOY ---/,/--- END DEPLOY ---/p' build.log
```

---

## 13.22
```bash
awk '{count[$2]++}
END{
  for(id in count)
    print "User ID:",id,"Occurrences:",count[id]
}' audit.log
```

---

## 13.23
```bash
awk 'NR==1{
print "| "$1" | "$2" | "$3" |"
print "|---|---|---|"
next}
{
print "| "$1" | "$2" | "$3" |"
}' proc.txt
```

---

## 13.24
```bash
sed '/\[database\]/a max_connections=500' app.ini
```

---

## 13.25
```bash
awk '{
  eur=$2*0.9
  if(eur>50)
    printf "%s EUR: %.2f\n",$1,eur
}' sales.txt
```
