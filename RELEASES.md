# Releases

## v0.1.0 (2026-05-28)

Initial release of RUNE.

### Features
- Hardware-bound AES-256-GCM encryption with custom TOTP time codes
- Capsule runtime with permanent and temporary types
- Process manager with auto-restart and exponential backoff
- Interactive REPL shell with full command set
- WASM-based plugin host with registry and CLI commands
- Cross-platform isolation: macOS sandbox (Seatbelt) + Linux namespaces
- Plugin CLI command system
- Reusable capsule templates with variable substitution

### Commands
- `init`, `unlock` — encryption management
- `start`, `stop`, `restart`, `list`, `status`, `logs` — process mgmt
- `capsule create|start|stop|restart|list|status|destroy|logs|exec|template`
- `template list|create`
- `daemon start|stop|status|foreground`
- `plugin install|list|info|disable|enable|remove`
