# Installation
## Quick Install
```bash
curl -fsSL https://github.com/gated-node/rune/releases/latest/download/rune-install.sh | sh
```
## Manual Install
```bash
tar xzf rune-*.tar.gz
sudo cp rune/rune /usr/local/bin/rune
```
## Build from Source
```bash
git clone https://github.com/gated-node/rune-build
cd rune-build
cargo build --release
sudo cp target/release/rune /usr/local/bin/rune
```
