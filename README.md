# RUNE

**Runtime Unix Node Environment** — Process Manager · Capsule Runtime · Plugin Host

[![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![Rust](https://img.shields.io/badge/rust-1.85+-orange)](https://www.rust-lang.org)
[![CI](https://github.com/gated-node/rune-build/actions/workflows/ci.yml/badge.svg)](https://github.com/gated-node/rune-build/actions/workflows/ci.yml)

RUNE is a lightweight process manager with an integrated capsule runtime and plugin host.
Every process runs in its own isolated, encrypted capsule environment with
hardware-bound time codes and automatic restarts.

## Quick Install

```bash
curl -fsSL https://github.com/gated-node/rune/releases/latest/download/rune-install.sh | sh
```

## Quick Start

```bash
rune init                    # Initialize encryption
rune daemon start            # Start the daemon
rune capsule create myapp --type permanent -- node app.js
rune capsule start myapp
rune                          # Interactive REPL
```

## Features

| Feature | Description |
|---|---|
| **Hardware Encryption** | AES-256-GCM + machine-bound TOTP time codes |
| **Capsule Runtime** | Isolated encrypted containers for processes |
| **Plugin Host** | WASM-based plugin system with registry |
| **Auto-Restart** | Exponential backoff with configurable policies |
| **Cross-Platform** | macOS sandbox + Linux namespaces |
| **Shell & CLI** | Full interactive REPL and direct CLI |

## Documentation

| Language | Link |
|---|---|
| English | [docs/en/](docs/en/index.md) |
| Deutsch | [docs/de/](docs/de/index.md) |

## Build from Source

```bash
git clone https://github.com/gated-node/rune-build
cd rune-build
cargo build --release
```

## License

MIT
