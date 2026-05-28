# Container Lifecycle

```
  ┌──────────┐
  │  Create  │
  └────┬─────┘
       │
  ┌────▼─────┐    ┌───────────┐
  │  Stopped │◄───│  Destroy  │
  └────┬─────┘    └───────────┘
       │
  ┌────▼─────┐
  │  Start   │
  └────┬─────┘
       │
  ┌────▼──────┐
  │  Running  │◄──────┐
  └────┬──────┘       │
       │              │
  ┌────▼─────┐   ┌────┴──────┐
  │  Crashed │   │  Restart  │
  └──────────┘   └───────────┘
```

## States

| State | Description |
|---|---|
| `stopped` | Container exists, process not running |
| `running` | Process is active |
| `crashed` | Process exited with non-zero code, max restarts reached |
| `starting` | Process is starting (transient) |

## Auto-Restart

Containers can be configured with a restart policy:

- **Always**: Restart regardless of exit code
- **OnFailure** (default): Restart only on non-zero exit
- **Never**: Never restart

When restarting, exponential backoff is applied:
`min(500ms × 2^attempt, 30s)`

## Auto-Cleanup

Temporary containers automatically clean up their overlay directories on stop or crash.
Permanent containers retain their encrypted data directory.
