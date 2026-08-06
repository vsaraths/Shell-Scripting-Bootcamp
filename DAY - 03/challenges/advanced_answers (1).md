# Advanced Answers

🔴 Advanced Answers (3.26 – 3.35)
Answer 3.26
Bash
#!/bin/bash
set -euo pipefail

name="Guest"
age=0

while (( $# > 0 )); do
  case "$1" in
    -n|--name)
      name="${2:-}"
      shift 2
      ;;
    -a|--age)
      age="${2:-0}"
      shift 2
      ;;
    *)
      echo "Unknown flag: $1" >&2
      exit 1
      ;;
  esac
done

echo "Parsed Profile -> Name: ${name} | Age: ${age}"
Answer 3.27
Bash
#!/bin/bash
set -euo pipefail

read -r total avail <<< "$(free -m | awk '/Mem:/ {print $2, $7}')"
used=$(( total - avail ))
pct=$(( (used * 100) / total ))

echo "Memory Telemetry: Total=${total}MB | Used=${used}MB (${pct}%)"

if (( pct > 85 )); then
  echo "[ALERT] Memory usage threshold breached!" >&2
fi
Answer 3.28
Bash
#!/bin/bash
set -euo pipefail

declare -A freqs

for (( i=1; i<=100; i++ )); do
  (( d1 = RANDOM % 6 + 1 ))
  (( d2 = RANDOM % 6 + 1 ))
  (( sum = d1 + d2 ))
  (( freqs[$sum]=${freqs[$sum]:-0} + 1 ))
done

echo "=== DICE ROLL SUM FREQUENCIES (100 ROLLS) ==="
for sum in $(echo "${!freqs[@]}" | tr ' ' '\n' | sort -n); do
  echo "  Sum ${sum} : ${freqs[$sum]} times"
done
Answer 3.29
Bash
#!/bin/bash
set -euo pipefail

if (( $# == 0 )); then
  set -- "/etc/passwd" "/etc/hosts"
fi

total_lines=0
valid_files=0

for file in "$@"; do
  if [[ -f "${file}" && -r "${file}" ]]; then
    lines=$(wc -l < "${file}")
    (( total_lines += lines ))
    (( valid_files++ ))
    echo "  [+] ${file}: ${lines} lines"
  else
    echo "  [-] ${file}: Missing or unreadable" >&2
  fi
done

echo "Aggregated ${total_lines} lines across ${valid_files} valid files."
Answer 3.30
Bash
#!/bin/bash
set -euo pipefail

if (( $# == 0 )); then
  set -- 120 95 110 105 130
fi

total_sum=0
for lat in "$@"; do
  (( total_sum += lat ))
done

(( avg_lat = total_sum / $# ))

echo "Sample Count  : $#"
echo "Total Latency : ${total_sum} ms"
echo "Average Latency: ${avg_lat} ms"
Answer 3.31
Bash
#!/bin/bash
set -euo pipefail

birth_year="${1:-1995}"
current_year=$(date +%Y)

if [[ ! "${birth_year}" =~ ^[0-9]{4}$ ]]; then
  echo "Error: Birth year must be a 4-digit integer!" >&2
  exit 1
fi

(( age = current_year - birth_year ))
echo "Calculated Age for Birth Year ${birth_year}: ${age} years old (in ${current_year})"
Answer 3.32
Bash
#!/bin/bash
set -euo pipefail

w1="${1:-50}"
w2="${2:-30}"
w3="${3:-20}"

(( rand = RANDOM % 100 + 1 ))

if (( rand <= w1 )); then
  bucket="Primary Pool (Weight ${w1}%)"
elif (( rand <= w1 + w2 )); then
  bucket="Secondary Pool (Weight ${w2}%)"
else
  bucket="Fallback Pool (Weight ${w3}%)"
fi

echo "Random Roll: ${rand}/100 -> Selected ${bucket}"
Answer 3.33
Bash
#!/bin/bash
set -euo pipefail

flags="${1:-5}" # Binary 0101

(( bit0 = flags & 1 ))
(( bit1 = (flags >> 1) & 1 ))
(( bit2 = (flags >> 2) & 1 ))

echo "Input Flags Decimal : ${flags}"
echo "Bit 0 Status        : ${bit0}"
echo "Bit 1 Status        : ${bit1}"
echo "Bit 2 Status        : ${bit2}"
Answer 3.34
Bash
#!/bin/bash
set -euo pipefail

counter_file="/tmp/rate_limit.cnt"

if [[ ! -f "${counter_file}" ]]; then
  echo "0" > "${counter_file}"
fi

count=$(cat "${counter_file}")
(( count++ ))
echo "${count}" > "${counter_file}"

echo "Atomic Rate Limiter Count: ${count}"
rm -f "${counter_file}"
Answer 3.35: Synthesis Capstone — Wizard Exam Synthesis (challenge-15-wizard-exam.sh)
Bash
#!/bin/bash
set -euo pipefail

# Challenge 15: Wizard Exam Synthesis Capstone
# Takes $1 (Name) and $2 (Birth Year), $3 Optional Spellbook File

show_usage() {
  echo "Usage: $(basename "$0") <wizard_name> <birth_year> [spellbook_file]"
  exit 1
}

if (( $# < 2 )); then
  show_usage
fi

wizard_name="$1"
birth_year="$2"
spellbook="${3:-}"

if [[ ! "${birth_year}" =~ ^[0-9]{4}$ ]]; then
  echo "Error: Birth year must be a 4-digit integer (e.g. 1995)!" >&2
  exit 1
fi

current_year=$(date +%Y)
(( wizard_age = current_year - birth_year ))
(( power_score = RANDOM % 100 + 1 ))

spell_status="No Spellbook Provided"
if [[ -n "${spellbook}" ]]; then
  if [[ -f "${spellbook}" ]]; then
    spell_count=$(wc -l < "${spellbook}")
    spell_status="Verified (${spell_count} spells contained)"
  else
    spell_status="Specified file '${spellbook}' not found!"
  fi
fi

echo "=========================================="
echo "       WIZARD EXAM REPORT CARD            "
echo "=========================================="
echo " Wizard Name  : ${wizard_name}"
echo " Birth Year   : ${birth_year} (Age: ${wizard_age})"
echo " Power Score  : ${power_score} / 100"
echo " Spellbook    : ${spell_status}"
echo "=========================================="

if (( power_score >= 70 )); then
  echo " Status       : PASSED EXAM (Archmage Grade)"
else
  echo " Status       : NEEDS PRACTICE (Apprentice Grade)"
fi
echo "=========================================="