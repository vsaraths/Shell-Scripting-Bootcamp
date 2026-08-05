
# 🛡️ Day 08: Input Guards & Text Manipulation

This module focuses on defensive input validation using multi-variable empty checks (`-z` combined with `||`), reading configurations directly from files via input redirection (`<`), isolating pattern occurrences using `grep`, and applying native Bash uppercase (`${var^^}`) and lowercase (`${var,,}`) string transformers.

---

## 📑 Challenge Mapping

| Script Name | Goal / Focus | Key Concept |
| :--- | :--- | :--- |
| `challenge-41-empty-string-emergency.sh` | Multi-Input Guard | `if [ -z "$1" ] \|\| [ -z "$2" ]` |
| `challenge-42-config-loader.sh` | File Input Redirection | `read -r active_host < host.txt` |
| `challenge-43-secret-phrase-extractor.sh` | Pattern Isolation & Count | `grep -o "every" \| wc -l` |
| `challenge-44-case-transformers.sh` | Case Conversion | `${tool^^}` and `${CLOUD,,}` |

---

## 🧪 Quick Test Examples

```bash
# Test Challenge 41 (Empty String Emergency)
chmod +x challenge-41-empty-string-emergency.sh
./challenge-41-empty-string-emergency.sh "Server01" "Production"

# Test Challenge 44 (Case Transformers)
chmod +x challenge-44-case-transformers.sh
./challenge-44-case-transformers.sh
