# 💬 Day 04: User Interaction & String Manipulation

This module covers interactive user prompts (`read`, `read -s`), fallback variable values (`${var:-default}`), string length evaluation (`${#var}`), and string slicing (`${var:offset:length}`).

---

## 📑 Challenge Mapping

| Script Name | Topic / Goal | Key Concept |
| :--- | :--- | :--- |
| `challenge-16-teleport.sh` | Interactive Input | `read -r variable` |
| `challenge-17-secret-passcode.sh` | Hidden Password Input | Silent prompt `read -s` |
| `challenge-18-default-rescue.sh` | Default Value Fallback | `${variable:-"Default"}` |
| `challenge-19-word-length.sh` | Character Counter | `${#variable}` |
| `challenge-20-text-slicer.sh` | Year Extraction | Slicing `${variable:0:4}` |
| `challenge-21-nickname-generator.sh` | Nickname Generator | Slicing argument `${1:0:3}` |

---

## 🧪 Quick Test Examples

```bash
# Test Challenge 16 (Prompt Input)
chmod +x challenge-16-teleport.sh
./challenge-16-teleport.sh

# Test Challenge 21 (Nickname Generator)
chmod +x challenge-21-nickname-generator.sh
./challenge-21-nickname-generator.sh Sarath
