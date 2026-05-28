# Daemon Management

The RUNE daemon runs in the background, managing all processes and containers.

## Starting the Daemon

```bash
# Background (default)
rune daemon start

# Foreground (debug/logs visible)
rune daemon foreground
```

## Stopping the Daemon

```bash
rune daemon stop
```

Sends a graceful shutdown: stops all processes, stops all containers, removes the socket file.

## Checking Status

```bash
rune daemon status
```

## Auto-Unlock

On startup, the daemon automatically:
1. Detects hardware encryption files
2. Reads the machine's hardware fingerprint
3. Computes the current time code
4. Unlocks the master key (no password needed if init'd without one)
5. Falls back to `OXYSH_PASSWORD` env var for legacy mode

## Environment Variables

| Variable | Description |
|---|---|
| `OXYSH_PASSWORD` | Password for legacy encryption mode |
| `RUST_LOG` | Log level (debug, info, warn, error) |

## Socket

The daemon listens on a Unix socket at:
- `~/Library/Application Support/rune/rune.sock` (macOS)
- `~/.config/rune/rune.sock` (Linux)

## PID File

The daemon writes its PID to:
- `~/Library/Application Support/rune/rune.pid` (macOS)
- `~/.config/rune/rune.pid` (Linux)
