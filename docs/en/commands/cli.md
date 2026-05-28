# CLI Reference

The RUNE CLI provides all functionality directly from the terminal.

## Usage

```bash
rune [COMMAND] [OPTIONS]
```

Without a command, RUNE opens the interactive REPL shell.

## Commands

### Encryption

| Command | Description |
|---|---|
| `init [password]` | Initialize encryption |
| `unlock <password>` | Unlock encryption (daemon required) |

### Daemon

| Command | Description |
|---|---|
| `daemon start` | Start daemon in background |
| `daemon foreground` | Start daemon in foreground (debug) |
| `daemon stop` | Stop the daemon |
| `daemon status` | Check if daemon is running |

### Processes

| Command | Description |
|---|---|
| `start <name> [--container <id>] -- <cmd>` | Start a managed process |
| `stop <name>` | Stop a managed process |
| `restart <name>` | Restart a managed process |
| `list` | List all managed processes |
| `status <name>` | Show process details |
| `logs <name> [lines]` | Show process logs |

### Containers

| Command | Description |
|---|---|
| `container create <name> --type permanent\|temporary [--template <tpl>] [--] <cmd>` | Create a container |
| `container start <id>` | Start a container |
| `container stop <id>` | Stop a container |
| `container restart <id>` | Restart a container |
| `container list` | List all containers |
| `container status <id>` | Show container details |
| `container destroy <id>` | Permanently delete a container |
| `container logs <id> [lines]` | Show container logs |
| `container exec <id> -- <cmd>` | Run a command in a container |

### Templates

| Command | Description |
|---|---|
| `template list` | List available templates |
| `template create <name> <path>` | Create a template from a directory |

### Service

| Command | Description |
|---|---|
| `install` | Install as system service |
| `uninstall` | Remove system service |
