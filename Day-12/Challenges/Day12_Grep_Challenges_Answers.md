# 💡 grep Challenges (Day 12) – Answers & Explanations

## Answer 12.1

```bash
grep -i "error" app.log
```

- `-i` → Ignore case.
- Matches `ERROR`, `Error`, and `error`.

---

## Answer 12.2

```bash
grep -v "INFO" syslog.txt
```

- `-v` → Invert the match.

---

## Answer 12.3

```bash
grep -nw "failed" auth.log
```

- `-n` → Show line numbers.
- `-w` → Match whole words only.

---

## Answer 12.4

```bash
grep -c " 404 " access.log
```

- `-c` → Count matching lines.

---

## Answer 12.5

```bash
grep -E "^CRITICAL|failed$" audit.log
```

- `^` → Start of line.
- `$` → End of line.
- `-E` → Extended regular expressions.

---

## Answer 12.6

```bash
grep -H "DB_ERROR" *.log
```

- `-H` → Show filename with each match.

---

## Answer 12.7

```bash
grep -B 1 -A 2 "FATAL" server.log
```

- `-B 1` → One line before.
- `-A 2` → Two lines after.

---

## Answer 12.8

```bash
grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" connections.log
```

Matches IPv4-style addresses.

---

## Answer 12.9

```bash
if grep -q "CRITICAL" system.log; then
    echo "Alert: Critical issues found!"
else
    echo "All systems operational."
fi
```

- `-q` → Quiet mode.

---

## Answer 12.10

```bash
grep -E "HTTP/[12]\.[01]" web.log
```

Uses character classes to match supported HTTP versions.

---

## Answer 12.11

```bash
grep -Eo "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" users.txt
```

- `-o` → Print only the matching text.

---

## Answer 12.12

```bash
grep -c "^$" config.conf
```

- `^$` → Matches blank lines.

---

## Answer 12.13

```bash
grep -e "WARN" -e "FAIL" app.log
```

- `-e` → Specify multiple search patterns.

---

## Answer 12.14

```bash
grep -l "CRITICAL_ERROR" *.log
```

- `-l` → Print matching filenames only.

---

## Answer 12.15

```bash
grep -E "https?://" web_traffic.log
```

- `?` → Makes `s` optional, matching both `http` and `https`.
