# CLI Reference
## Encryption
| Command | Description |
|---|---|
| `init` | Initialize encryption (hardware-bound) |
| `unlock <password>` | Unlock encryption |
## Daemon
| Command | Description |
|---|---|
| `daemon start` | Start daemon in background |
| `daemon stop` | Stop the daemon |
| `daemon status` | Check if daemon is running |
## Processes
| Command | Description |
|---|---|
| `start <name> -- <cmd>` | Start a managed process |
| `stop <name>` | Stop a managed process |
| `list` | List all managed processes |
| `logs <name> [lines]` | Show process logs |
## Capsules
| Command | Description |
|---|---|
| `capsule create <name> --type permanent|temporary -- <cmd>` | Create |
| `capsule start <id>` | Start |
| `capsule stop <id>` | Stop |
| `capsule list` | List all capsules |
| `capsule destroy <id>` | Delete permanently |
| `capsule logs <id> [lines]` | Show logs |
| `capsule exec <id> -- <cmd>` | Run command inside |
## Plugins
| Command | Description |
|---|---|
| `plugin install <name> [--url <url>]` | Install a plugin |
| `plugin list` | List installed plugins |
| `plugin info <name>` | Show plugin details |
| `plugin disable <name>` | Disable a plugin |
| `plugin enable <name>` | Enable a plugin |
| `plugin remove <name>` | Remove a plugin |
