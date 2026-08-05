
# 📡 Day 07: Command Capture & Complex Decisions

This module covers capturing real-time command output into variables using command substitution (`$()`), querying system metadata (`date`, `ls`, `uname`), implementing multi-branch decision flows (`if/elif/else`), and validating numerical constraints using logical AND (`&&`) operators inside arithmetic evaluation blocks.

---

## 📑 Challenge Mapping

| Script Name | Goal / Focus | Key Concept |
| :--- | :--- | :--- |
| `challenge-36-time-traveler.sh` | System Time Marker | Command capture `current_time=$(date)` |
| `challenge-37-folder-auditor.sh` | Directory Item Count | Pipeline capture `file_count=$(ls \| wc -l)` |
| `challenge-38-kernel-investigator.sh` | Kernel Version Audit | Operating system check `uname -r` |
| `challenge-39-traffic-light.sh` | Signal State Router | Multi-branch conditionals (`if/elif/else`) |
| `challenge-40-number-range-guard.sh` | Numeric Range Guard | Bounds checking `(( num > 10 && num < 50 ))` |

---

## 🧪 Quick Test Examples

```bash
# Test Challenge 36 (Time Traveler)
chmod +x challenge-36-time-traveler.sh
./challenge-36-time-traveler.sh

# Test Challenge 39 (Traffic Light Simulator)
chmod +x challenge-39-traffic-light.sh
./challenge-39-traffic-light.sh Green
