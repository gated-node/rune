# Container Types

RUNE supports two container types, inspired by Minecraft cloud systems.

## Permanent Containers

```bash
rune container create myapp --type permanent -- node app.js
```

- **Persistent data**: Data in the container's data directory survives restarts
- **Encrypted**: All data encrypted with AES-256-GCM
- **Use cases**: Databases, stateful applications, long-running services

### Directory Structure
```
~/Library/Application Support/rune/containers/<uuid>/
├── container.toml       # Container configuration
├── key.enc              # Encrypted container key
├── data/                # Persistent data (encrypted)
├── logs/
│   ├── stdout.log
│   └── stderr.log
```

## Temporary Containers

```bash
rune template create base /path/to/base-filesystem
rune container create myapp --type temporary --template base -- node app.js
```

- **Ephemeral**: Data is wiped when the container stops
- **Template-based**: Filesystem from a template
- **Use cases**: Build jobs, stateless workers, test environments

### Directory Structure
```
~/Library/Application Support/rune/containers/<uuid>/
├── container.toml       # Container configuration
├── overlay/
│   ├── upper/           # Writable overlay layer
│   └── work/            # Overlayfs work dir
├── logs/
│   ├── stdout.log
│   └── stderr.log
```
