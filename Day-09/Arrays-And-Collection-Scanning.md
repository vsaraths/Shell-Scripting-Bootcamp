
# 📦 Day 09: Dynamic Execution Arrays & Collections

This module introduces indexed array declaration (`array=("val1" "val2")`), accessing specific elements by index location (`${array[1]}`), scanning through entire collections with `for` loops (`"${array[@]}"`), and tracking collection sizes dynamically using array length syntax (`${#array[@]}`).

---

## 📑 Challenge Mapping

| Script Name | Goal / Focus | Key Concept |
| :--- | :--- | :--- |
| `challenge-45-array-blueprint.sh` | Indexed Array Lookup | Index selection `${servers[1]}` |
| `challenge-46-global-array-scanner.sh` | Array Iteration Loop | Scanning all elements `${tools[@]}` |
| `challenge-47-array-size-tracker.sh` | Collection Size Tracking | Array element count `${#checklist[@]}` |

---

## 🧪 Quick Test Examples

```bash
# Test Challenge 45 (Array Blueprint)
chmod +x challenge-45-array-blueprint.sh
./challenge-45-array-blueprint.sh

# Test Challenge 46 (Global Array Scanner)
chmod +x challenge-46-global-array-scanner.sh
./challenge-46-global-array-scanner.sh
