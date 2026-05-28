# RUNE

**Runtime Unix Node Environment** — Process Manager Shell & Container Runtime

[![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![Rust](https://img.shields.io/badge/rust-1.85+-orange)](https://www.rust-lang.org)
[![Release](https://img.shields.io/github/v/release/talbergh/rune)](https://github.com/talbergh/rune/releases)

> Inspired by the mystical runes of old — small symbols that hold great power.  
> RUNE gives every process its own isolated, encrypted container environment.

RUNE is a lightweight process manager shell with integrated container runtime.
It starts, monitors, and auto-restarts processes — each one running in its own
encrypted, hardware-bound, time-secured container environment.

## Quick Install

```bash
curl -fsSL https://github.com/talbergh/rune/releases/latest/download/rune-install.sh | sh
```

Or download a binary from the [releases page](https://github.com/talbergh/rune/releases).

## Quick Start

```bash
# Initialize encryption (hardware + time-based, no password needed)
rune init

# Start the daemon
rune daemon start

# Create and start a container
rune container create myapp --type permanent -- node app.js
rune container start myapp

# Start an isolated process (auto-container)
rune start myapp -- node app.js

# Interactive shell
rune
```

## Key Features

| Feature | Description |
|---|---|
| **Hardware Encryption** | AES-256-GCM + machine-bound TOTP time codes |
| **Auto-Containers** | Every process gets its own temp container by default |
| **Auto-Restart** | Exponential backoff with configurable policies |
| **Zero-Config** | Works out of the box, no platform keychains needed |
| **Shell & CLI** | Full interactive REPL and direct command-line interface |
| **Templates** | Reusable container filesystem templates |

## Documentation

| Language | Link |
|---|---|
| English | [docs/en/](docs/en/index.md) |
| Deutsch | [docs/de/](docs/de/index.md) |

## Build from Source

```bash
git clone https://github.com/talbergh/rune
cd rune
cargo build --release
./target/release/rune --help
```

## License

MIT
