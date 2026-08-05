
# 🔍 Day 12: Log Parsing & Pattern Matching with Grep

This module introduces log filtering and regular expressions in shell scripting. You will learn how to search log files, extract error status codes (`404`, `500`), and perform count operations using `grep` and pattern matching flags.

---

## 📑 Module Overview

| Script Name | Goal / Focus | Key Concept |
| :--- | :--- | :--- |
| `log_analyzer.sh` | Parse & Count Log Errors | `grep -c`, OR patterns (`\|`), line counting (`wc -l`) |

---

## 🧪 Quick Test Examples

```bash
# Make the script executable
chmod +x log_analyzer.sh

# Run log analyzer (automatically generates a sample access.log if missing)
./log_analyzer.sh

# Run log analyzer against a specific log file
./log_analyzer.sh /var/log/nginx/access.log
