# 📦 Day 02: Variable Basics & Syntax Quirks

This module covers the core fundamentals of Bash variables: declaring and updating values, string concatenation, variable scope inside double quotes vs single quotes, avoiding space syntax traps around `=`, and handling unassigned/empty variables gracefully.

---

## 📑 Challenge Mapping

| Script Name | Goal / Focus | Key Concept |
| :--- | :--- | :--- |
| `challenge-01-backpack.sh` | Variable Assignment & Mutability | Basic variables & value reassignment |
| `challenge-02-badge.sh` | String Concatenation | Combining variables `${var1} ${var2}` |
| `challenge-03-order.sh` | Appending String Values | Variable self-reference `$var = "$var + new"` |
| `challenge-04-space-trap.sh` | Syntax Error Awareness | Preventing spaces around `=` |
| `challenge-05-double-quote-shield.sh` | Quote Preservation | Double quotes `"$var"` vs missing quotes |
| `challenge-06-ghost-hunter.sh` | Empty/Unset Variables | Reading empty variable references safely |

---

## 🧪 Quick Test Examples

```bash
# Test Challenge 01 (Backpack Setup)
chmod +x challenge-01-backpack.sh
./challenge-01-backpack.sh

# Test Challenge 04 (Space Trap - Error Demonstration)
chmod +x challenge-04-space-trap.sh
./challenge-04-space-trap.sh
