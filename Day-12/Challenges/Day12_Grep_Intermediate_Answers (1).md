# 💡 grep Challenges (Day 12) – Intermediate Answers

## Answer 12.16

```bash
grep -E '" [45][0-9]{2} ' nginx_access.log
```

- `[45]` matches 4xx and 5xx status codes.

---

## Answer 12.17

```bash
grep -E '10:1[5-9]:[0-5][0-9]' app.log
```

Matches timestamps from **10:15:00** through **10:19:59**.

---

## Answer 12.18

```bash
grep "Failed password for" auth.log \
| grep -oE "for (invalid user )?[^ ]+" \
| awk '{print $NF}'
```

Alternative:

```bash
grep -oP 'Failed password for (invalid user )?\K\S+' auth.log
```

---

## Answer 12.19

```bash
grep "Failed password" auth.log \
| grep -oE '[0-9]{1,3}(\.[0-9]{1,3}){3}' \
| sort -u \
| wc -l
```

---

## Answer 12.20

```bash
grep -Ev '^[[:space:]]*([#;]|$)' server.conf
```

Shows only active configuration entries.

---

## Answer 12.21

```bash
grep -oE '\[[0-9]+\]' systemd.log | tr -d '[]'
```

Extracts only PID numbers.

---

## Answer 12.22

```bash
grep -oE '[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}' transaction.log
```

Matches standard UUID format.

---

## Answer 12.23

```bash
grep -rn --exclude="*.gz" "CRITICAL" /var/log/app/
```

---

## Answer 12.24

```bash
grep -w "python" packages.list
```

Matches only the standalone word `python`.

---

## Answer 12.25

```bash
grep -C 3 -E "Kernel Panic|Out of memory" dmesg.log
```

- `-C 3` displays three lines before and after each match.
