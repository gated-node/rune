# Releases

## v0.1.0 (2026-05-28)

Initial release of RUNE.

### Features
- Hardware-bound AES-256-GCM encryption with custom TOTP time codes
- Container runtime with permanent and temporary container types
- Process manager with auto-restart and exponential backoff
- Interactive REPL shell with full command set
- Template system for reusable container filesystems
- Auto-unlock on daemon start (password-less when no password set)
- Per-container encrypted data directories
- macOS launchd and Linux systemd service support

### Commands
- `init`, `unlock` — encryption management
- `start`, `stop`, `restart`, `list`, `status`, `logs` — process management
- `container create|start|stop|restart|list|status|destroy|logs|exec` — container management
- `template list|create` — template management
- `daemon start|stop|status|foreground` — daemon control
- `clear`, `help`, `exit` — shell utilities
