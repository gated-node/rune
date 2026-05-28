# Templates

Templates provide reusable base filesystems for containers.

## Creating a Template

```bash
# Create from a directory
rune template create nodejs /usr/local/nodejs

# List available templates
rune template list
```

## Template Structure

```
~/Library/Application Support/rune/templates/<name>/
├── template.toml        # Template configuration
└── fs/                  # Copied filesystem
```

## Template Configuration (`template.toml`)

```toml
name = "nodejs"
version = "1.0.0"
description = "Node.js runtime environment"
default_cmd = "node"
default_args = []
isolation = "namespace"

[resource_limits]
max_memory = "512M"
max_cpu = 0.5
max_processes = 100
max_open_files = 1024
```

## Using Templates

Temporary containers require a template:

```bash
rune container create build --type temporary --template nodejs -- node build.js
```

The template's filesystem is used as the read-only base layer, with a writable overlay for runtime changes.
