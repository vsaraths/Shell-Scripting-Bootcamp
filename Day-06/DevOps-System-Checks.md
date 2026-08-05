
# ⚙️ Day 06: DevOps System Checks & Safety Guards

This module covers essential system validation mechanics in Bash: tracking exit codes (`$?`), load-balancing randomization (`$RANDOM`), threshold evaluations, argument count validation (`$#`), string-stripping via parameter expansion (`${var#*=}`), `readonly` immutability locks, and synthesizing all concepts into an interactive deployment dashboard.

---

## 📑 Challenge Mapping

| Script Name | Goal / Focus | Key Concept |
| :--- | :--- | :--- |
| `challenge-28-exit-code-guard.sh` | Exit Status Verification | `status=$?` and `if ((status!=0))` |
| `challenge-29-random-server-picker.sh` | Random Server Router | `$RANDOM % 3 + 1` & `if/elif/else` |
| `challenge-30-disk-usage-warning.sh` | Disk Threshold Alert | Numeric comparison `((disk_used > 80))` |
| `challenge-31-parameter-count-check.sh` | Input Parameter Guard | Argument count check `(( $# == 0 ))` |
| `challenge-32-custom-word-splitter.sh` | Custom Delimiter Parsing | `IFS=","` string loop iteration |
| `challenge-33-config-value-finder.sh` | Parameter Extraction | String prefix trimming `${line#*=}` |
| `challenge-34-readonly-lockdown.sh` | Immutable System Variable | `readonly VAR="value"` lock |
| `challenge-35-deployment-dashboard.sh` | Deployment Dashboard | Comprehensive script synthesis |

---

## 🧪 Quick Test Examples

```bash
# Test Challenge 28 (Exit Code Guard)
chmod +x challenge-28-exit-code-guard.sh
./challenge-28-exit-code-guard.sh

# Test Challenge 35 (Deployment Dashboard)
chmod +x challenge-35-deployment-dashboard.sh
./challenge-35-deployment-dashboard.sh
