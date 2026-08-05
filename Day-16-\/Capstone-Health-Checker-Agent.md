
# 🏆 Day 16 Capstone: Server Health Monitoring Agent

The final capstone project! This script combines system metrics collection (disk usage, system uptime), network connectivity probes (`ping`), process validation, and automated threshold alerts into a standalone health check agent ready for production or cron job scheduling.

---

## 📑 Module Overview

| Script Name | Goal / Focus | Key Concept |
| :--- | :--- | :--- |
| `health_agent.sh` | Production Health Checker | Threshold validation, network status probes, system metrics gathering |

---

## 🧪 Quick Test Examples

```bash
# Make the script executable
chmod +x health_agent.sh

# Run the health checker agent
./health_agent.sh
