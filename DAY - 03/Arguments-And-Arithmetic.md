# 🚀 Day 03: Positional Arguments & Arithmetic Operations

This module focuses on capturing dynamic command-line inputs (`$1`, `$2`, `$@`) and performing math calculations using Bash's arithmetic evaluation `(( ))`.

---

## 📑 Challenge Mapping

| Script Name | Topic / Goal | Key Concept |
| :--- | :--- | :--- |
| `challenge-07-greet-me.sh` | Greeting Blender | Positional Argument `$1` |
| `challenge-08-duo.sh` | Dynamic Duo | Multiple Arguments (`$1`, `$2`) |
| `challenge-09-party.sh` | Guest List Capture | All Arguments (`$@`) |
| `challenge-10-level-up.sh` | Level Up Counter | Addition `(( level++ ))` |
| `challenge-11-multiply.sh` | Number Multiplier | Multiplication `(( result = $1 * 2 ))` |
| `challenge-12-score-splitter.sh` | Score Splitter | Division `(( loot / 4 ))` |
| `challenge-13-dice-match.sh` | Magic Dice Match | Random Modulo `(( $RANDOM % 5 ))` |
| `challenge-14-file-detective.sh` | File Detective | File Test `[ -f "$file" ]` |
| `challenge-15-wizard-exam.sh` | Wizard Exam Synthesis | Full Script Integration |

---

## 🧪 Quick Test Examples

```bash
# Run Challenge 07
chmod +x challenge-07-greet-me.sh
./challenge-07-greet-me.sh Sarath

# Run Challenge 15 (Wizard Exam)
chmod +x challenge-15-wizard-exam.sh
./challenge-15-wizard-exam.sh Sarath 1995
