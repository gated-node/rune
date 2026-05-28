#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:-$(git describe --tags --abbrev=0 2>/dev/null || echo "0.1.0")}"
echo "Building RUNE v${VERSION}..."

cd "$(dirname "$0")/.."

# Build the binary
cargo build --release
BINARY="target/release/rune"

if [ ! -f "$BINARY" ]; then
    echo "Error: Build failed - binary not found at $BINARY"
    exit 1
fi

# Create release packages
RELEASE_DIR="target/rune-${VERSION}"
mkdir -p "$RELEASE_DIR"

# Detect platform
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"
case "$ARCH" in
    x86_64) ARCH="amd64" ;;
    aarch64|arm64) ARCH="arm64" ;;
esac
PLATFORM="${OS}-${ARCH}"
ARCHIVE="rune-${VERSION}-${PLATFORM}.tar.gz"

# Copy binary and scripts
cp "$BINARY" "$RELEASE_DIR/rune"
cp scripts/rune-install.sh "$RELEASE_DIR/"
cp README.md "$RELEASE_DIR/"
cp LICENSE "$RELEASE_DIR/"

cd target
tar czf "$ARCHIVE" "rune-${VERSION}/"
cd ..

echo "Package: target/${ARCHIVE} ($(du -h target/${ARCHIVE} | cut -f1))"

# Check if gh is available for release upload
if command -v gh &>/dev/null && gh auth status &>/dev/null 2>&1; then
    echo ""
    echo "Creating GitHub release v${VERSION}..."
    gh release create "v${VERSION}" \
        "target/${ARCHIVE}" \
        --title "RUNE v${VERSION}" \
        --notes "See RELEASES.md for details."
    echo "Release published!"
else
    echo ""
    echo "To publish the release, run:"
    echo "  gh release create v${VERSION} target/${ARCHIVE} --title 'RUNE v${VERSION}'"
fi
