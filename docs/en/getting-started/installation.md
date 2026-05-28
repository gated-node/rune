# Installation

## Quick Install (recommended)

```bash
curl -fsSL https://github.com/talbergh/rune/releases/latest/download/rune-install.sh | sh
```

This installs the pre-built binary to `/usr/local/bin/rune`.

## Manual Install

Download the latest archive for your platform from the [releases page](https://github.com/talbergh/rune/releases):

```bash
tar xzf rune-*.tar.gz
sudo cp rune-*/rune /usr/local/bin/rune
```

## Build from Source

```bash
git clone https://github.com/talbergh/rune
cd rune
cargo build --release
sudo cp target/release/rune /usr/local/bin/rune
```

## Service Installation

After installing the binary, optionally install it as a system service:

```bash
# macOS (launchd)
rune install

# Linux (systemd --user)
rune install
```
