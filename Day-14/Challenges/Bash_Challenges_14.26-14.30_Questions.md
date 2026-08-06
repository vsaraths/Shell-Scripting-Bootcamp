# Bash Scripting Challenges 14.26--14.30

## 📋 QUESTIONS

### Challenge 14.26: Production Deployment Rollback Framework with Contextual Traps

-   **Scenario**: Write a deployment script function `deploy_service`
    that executes 3 distinct steps: `pull_artifact`, `apply_migrations`,
    and `restart_containers`. Define an error-handling trap using
    `trap ... ERR` that captures the exact line number where any step
    failed, triggers a `rollback` function to undo changes, and cleans
    up temporary release artifacts before exiting with code `1`.
-   **Requirements**: Must enforce `set -euo pipefail` and maintain
    isolated local scope variables for release directory states.

### Challenge 14.27: Graceful Background Process Pool Manager with Signal Propagation

-   **Scenario**: Write a script that spawns 3 background worker
    processes (e.g., `sleep 30`) and stores their PIDs in a local array.
    Register a `SIGINT` / `SIGTERM` trap handler that catches
    termination signals, terminates all child processes gracefully,
    waits for them, then exits.

### Challenge 14.28: Reusable Resilient API Retry Wrapper Function

-   **Scenario**: Build `retry_command` that accepts max retries, delay,
    and a command. Retry failures with delays while remaining compatible
    with `set -e`.

### Challenge 14.29: Multi-Resource Lock Guard with Deadlock Prevention

-   **Scenario**: Implement `acquire_locks` and `release_locks` for
    multiple atomic lock files. On any acquisition failure, release
    previously acquired locks in reverse order. Register an `EXIT` trap.

### Challenge 14.30: Production Health Check Agent Framework with Strict Mode Isolation

-   **Scenario**: Build a modular health-check framework with
    `check_disk`, `check_memory`, and `check_network`. Execute each
    independently so one failure does not stop the remaining checks,
    while collecting a summary.
