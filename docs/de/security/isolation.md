# Isolation
## Plattform-Isolation
| Plattform | Mechanismus |
|---|---|
| **Linux** | `unshare(CLONE_NEWNS|NEWPID|NEWNET|NEWIPC)`, tmpfs, rlimit |
| **macOS** | `sandbox_init()` mit Seatbelt-Profil, rlimit |
