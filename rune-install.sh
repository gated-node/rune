#!/usr/bin/env bash
set -euo pipefail

RUNE_DIR="${HOME}/.config/rune"
BIN_DIR="${HOME}/.local/bin"

echo "==> rune Installer"
echo ""

# Detect OS
case "$(uname -s)" in
    Linux*)   OS="linux";;
    Darwin*)  OS="macos";;
    CYGWIN*|MINGW*|MSYS*) OS="windows";;
    *)        echo "Unsupported OS: $(uname -s)"; exit 1;;
esac
echo "Detected OS: ${OS}"

# Build or download
if command -v cargo &>/dev/null; then
    echo "Building rune from source..."
    cargo build --release 2>&1 | tail -5
    SOURCE_BIN="target/release/rune"
else
    echo "Cargo not found. Please install Rust first: https://rustup.rs"
    exit 1
fi

if [ ! -f "$SOURCE_BIN" ]; then
    echo "Build failed: binary not found at ${SOURCE_BIN}"
    exit 1
fi

# Install binary
mkdir -p "$BIN_DIR"
cp "$SOURCE_BIN" "$BIN_DIR/rune"
chmod +x "$BIN_DIR/rune"
echo "Installed rune to ${BIN_DIR}/rune"

# Create config directory
mkdir -p "${RUNE_DIR}/processes"
mkdir -p "${RUNE_DIR}/logs"
mkdir -p "${RUNE_DIR}/processes"

echo ""

# Offer to install as service
echo "Install as system service? (requires sudo on Linux)"
read -r -p "Install service? [y/N] " response
if [[ "$response" =~ ^[Yy]$ ]]; then
    "${BIN_DIR}/rune" install
fi

echo ""
echo "==> rune installed successfully!"
echo ""
echo "To get started:"
echo "  1. Start the daemon:  rune daemon start"
echo "  2. Open the shell:    rune"
echo "  3. View help:         rune --help"
echo ""
echo "Make sure ${BIN_DIR} is in your PATH."
