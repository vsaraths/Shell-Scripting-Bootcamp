---

### 💡 Script Code (`text_processor.sh`)

Here is the exact code to put inside **`text_processor.sh`**:

```bash
#!/bin/bash

# 1. SED Demonstration: Replace configuration values in-place
echo "Creating dummy configuration file (env_config.txt)..."
echo "DB_HOST=127.0.0.1" > env_config.txt
echo "DB_PORT=5432" >> env_config.txt

echo "▶️ Before SED modification:"
cat env_config.txt

echo -e "\nUpdating DB_HOST using sed stream editing..."
sed -i 's/127.0.0.1/10.0.0.50/g' env_config.txt

echo "▶️ After SED modification:"
cat env_config.txt

echo -e "\n------------------------------------------"

# 2. AWK Demonstration: Extract and format columnar data
echo "Creating dummy system metrics log (metrics.txt)..."
cat << 'EOF' > metrics.txt
srv01 ACTIVE 85
srv02 ACTIVE 42
srv03 IDLE 12
srv04 DOWN 0
EOF

echo "Parsing system metrics using awk..."
echo "=========================================="
awk '{print "🖥️ Server: " $1 " | Status: " $2 " | CPU: " $3 "%"}' metrics.txt
echo "=========================================="
