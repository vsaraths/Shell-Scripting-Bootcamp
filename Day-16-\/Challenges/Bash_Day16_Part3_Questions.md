Here are the 5 Advanced / DevOps Capstone Challenges (16.26 -- 16.30)
for Day 16: Building Health Checker Agents & System Monitors.These
production-grade challenges simulate real-world, automated
infrastructure monitoring: daemonizing background agents, tracking
multi-metric health scores, dynamically auto-remediating failing
services, preventing alert fatigue with state transition debouncing, and
building a full system monitoring daemon.📋 QUESTIONSChallenge 16.26:
Production Health Monitoring Daemon (node_sentinel.sh)Scenario:
Construct a standalone monitoring daemon node_sentinel.sh that runs
continuously in the background.Requirements:Enforce strict mode (set
-euo pipefail) and an atomic PID lockfile
(/tmp/node_sentinel.pid).Implement signal traps:SIGINT / SIGTERM: Clean
up the PID file, log "\[INFO\] Sentinel daemon stopped", and exit
cleanly.SIGHUP: Reload configuration settings (/tmp/sentinel.conf)
without restarting the process.Cycle continuously every
$CHECK_INTERVAL seconds (default: 5s), sampling Disk (/), Memory, and CPU 1-min load average.Write JSON-formatted telemetry metrics to /tmp/sentinel_telemetry.log.Challenge 16.27: Multi-Service Auto-Remediation Engine with BackoffScenario: Create an automated service recovery engine auto_heal.sh.Requirements:Monitor an array of target microservice processes (nginx, redis, sshd).If a process is down, attempt auto-remediation up to 3 times with an exponential delay backoff (2s, 4s, 8s).If remediation succeeds, log "[RECOVERED] Service <name> restored on attempt N".If all 3 attempts fail, generate a critical incident alert payload ([FATAL_SERVICE_FAILURE]) and return exit code 1.Challenge 16.28: Incident State Engine with Flapping ProtectionScenario: Build a state-tracking notification manager alert_debouncer.sh to prevent alert fatigue.Requirements:Persist system state across execution passes inside /tmp/sentinel_state.json.Transition through explicit state machine levels: OK, WARNING, CRITICAL, and RECOVERED.Emit an external notification only when the state actually changes.If the check toggles back and forth between OK and CRITICAL more than 3 times within a 10-cycle window, flag the system state as [FLAPPING] and suppress duplicate alert emails.Challenge 16.29: Synthetic HTTP/Database Endpoint SLA & Latency ProbeScenario: Build an synthetic end-to-end user transaction probe sla_monitor.sh.Requirements:Measure response time latencies across HTTP endpoints using curl -w "%{time_total}".Measure TCP database/cache socket latency using Bash time built-ins or nc.Calculate SLA compliance metrics:Latency < 200ms: [PASS]Latency 200ms - 1000ms: [DEGRADED]Latency > 1000ms or Timeout: [SLA_BREACH]Maintain an ongoing rolling uptime percentage score ($SLA%
= `\frac{\text{PASS}}{\text{TOTAL}}`{=tex}
`\times 100`{=tex}\$).Challenge 16.30: Production Monitoring & Alerting
Master AgentScenario: Combine every concept learned across the 16-day
track into a single production-grade Monitoring & Alerting Master Agent
(sys_agent.sh).Requirements:CLI Interface: Accept -c `<config>`{=html},
-d (daemon mode), -s (single-pass status card), and -h (help
menu).Strict Mode & Traps: Full set -euo pipefail compliance, atomic
lock guard, and EXIT/SIGTERM cleanup.Multi-System Probes: Sample Disk,
CPU Load, Memory, and Network/Process availability in parallel or
structured sequences.Alerting & Exporting: Format colorized terminal
output in interactive mode, generate JSON metrics in daemon mode, and
append state logs to an audit ledger.
