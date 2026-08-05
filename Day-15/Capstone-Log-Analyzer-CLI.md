
# 🏆 Day 15 Capstone: Log Analyzer CLI Project

This capstone project combines option flag routing (`getopts`), string/column parsing (`awk`, `sort`, `uniq`), regular expression filtering (`grep`), and strict script execution safety (`set -euo pipefail`) into an enterprise-ready command-line tool for analyzing server logs.

---

## 📑 Module Overview

| Script Name | Goal / Focus | Key Concept |
| :--- | :--- | :--- |
| `log_analyzer_cli.sh` | Production Log Analyzer CLI | Flag parsing (`-f`, `-e`), IP frequency counting, HTTP error filtering |

---

## 🧪 Quick Test Examples

```bash
# Make the script executable
chmod +x log_analyzer_cli.sh

# Run analysis on default or custom log file
./log_analyzer_cli.sh -f sample.log

# Filter and display HTTP error occurrences only
./log_analyzer_cli.sh -f sample.log -e
