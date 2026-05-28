# Isolation
## Platform Isolation
| Platform | Mechanism |
|---|---|
| **Linux** | `unshare(CLONE_NEWNS|NEWPID|NEWNET|NEWIPC)`, tmpfs, rlimit |
| **macOS** | `sandbox_init()` with Seatbelt profile, rlimit |
| **Windows** | Restricted PATH, env vars (job objects planned) |
