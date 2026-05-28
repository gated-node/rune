# Isolation

RUNE provides process and container isolation to prevent interference between workloads.

## Environment Variables

Each container process receives these environment variables:

| Variable | Description |
|---|---|
| `RUNE_CONTAINER=1` | Marks the process as containerized |
| `RUNE_CONTAINER_ID=<uuid>` | Unique container identifier |
| `RUNE_CONTAINER_TYPE=<type>` | "permanent" or "temporary" |
| `RUNE_CONTAINER_DIR=<path>` | Path to the container's data directory |

## Process Isolation

- Each process gets its own log directory
- Process lifecycle is independent of other processes
- Auto-restart with configurable policy (Always, OnFailure, Never)
- Exponential backoff (500ms – 30s) prevents restart storms

## Container Isolation

- Separate data directories per container
- Encrypted at rest with per-container AES-256 keys
- Temporary containers: data wiped on stop
- Permanent containers: data persists and is encrypted

## Platform Isolation

| Platform | Isolation |
|---|---|
| macOS | new session (setsid), restricted PATH |
| Linux | new session (setsid), restricted PATH |
| Future | Linux namespaces, cgroups, seccomp |
