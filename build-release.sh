#!/usr/bin/env bash
set -euo pipefail
VERSION="${1:-$(git describe --tags --abbrev=0 2>/dev/null || echo "0.1.0")}"
echo "Building RUNE v${VERSION}..."
cd "$(dirname "$0")"
BUILD_DIR="$(mktemp -d)"
git clone https://github.com/gated-node/rune-build.git "$BUILD_DIR"
cd "$BUILD_DIR"
cargo build --release
BINARY="target/release/rune"
[ -f "$BINARY" ] || { echo "Build failed"; exit 1; }
RELEASE_DIR="target/rune-${VERSION}"
mkdir -p "$RELEASE_DIR"
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"
case "$ARCH" in x86_64) ARCH="amd64" ;; aarch64|arm64) ARCH="arm64" ;; esac
ARCHIVE="rune-${VERSION}-${PLATFORM}.tar.gz"
cp "$BINARY" "$RELEASE_DIR/rune"
cp README.md LICENSE "$RELEASE_DIR/"
cd target && tar czf "$ARCHIVE" "rune-${VERSION}/" && cd ..
echo "Package: target/${ARCHIVE}"
if command -v gh &>/dev/null && gh auth status &>/dev/null 2>&1; then
    gh release create "v${VERSION}" "target/${ARCHIVE}" --title "RUNE v${VERSION}"
fi
