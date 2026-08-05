
# 🔄 Day 05: Loops, Counters & File System Operations

This module focuses on controlling execution flow with `while` loops, performing variable increments/decrements (`(( counter++ ))`), verifying directory existence (`[ ! -d "$folder" ]`), constructing timestamped filenames, and parsing system environment variables (`$PATH`).

---

## 📑 Challenge Mapping

| Script Name | Topic / Goal | Key Concept |
| :--- | :--- | :--- |
| `challenge-22-high-five-counter.sh` | High-Five Counter | `while` loop & `(( counter++ ))` |
| `challenge-23-countdown-timer.sh` | Blast-Off Timer | Decrement `(( timer-- ))` & `sleep 1` |
| `challenge-24-multiplier-table.sh` | Multiplication Calculator | Arithmetic calculation with `$1` |
| `challenge-25-directory-guard.sh` | Directory Guard | Check missing folder `[ ! -d "$dir" ]` |
| `challenge-26-backup-filename.sh` | Dynamic Backup Naming | Variable concatenation inside `${var}` |
| `challenge-27-path-cleaner.sh` | System PATH Formatter | String replacement `${PATH//:/\n}` |

---

## 🧪 Quick Test Examples

```bash
# Test Challenge 23 (Countdown Timer)
chmod +x challenge-23-countdown-timer.sh
./challenge-23-countdown-timer.sh

# Test Challenge 24 (Multiplier Table)
chmod +x challenge-24-multiplier-table.sh
./challenge-24-multiplier-table.sh 7
