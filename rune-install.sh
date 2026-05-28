#!/usr/bin/env sh
set -e

# RUNE - Quick Installer
# Usage: curl -fsSL https://github.com/talbergh/rune/releases/latest/download/rune-install.sh | sh

VERSION="${1:-latest}"
REPO="talbergh/rune"
PLATFORM=""

detect_platform() {
    local os arch
    os="$(uname -s | tr '[:upper:]' '[:lower:]')"
    arch="$(uname -m)"
    
    case "$arch" in
        x86_64)  arch="amd64" ;;
        aarch64|arm64) arch="arm64" ;;
    esac
    
    PLATFORM="${os}-${arch}"
}

download_release() {
    local url archive
    if [ "$VERSION" = "latest" ]; then
        url="https://github.com/${REPO}/releases/latest/download/rune-${PLATFORM}.tar.gz"
    else
        url="https://github.com/${REPO}/releases/download/v${VERSION}/rune-${VERSION}-${PLATFORM}.tar.gz"
    fi
    
    echo "Downloading RUNE for ${PLATFORM}..."
    
    archive="/tmp/rune-${PLATFORM}.tar.gz"
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$url" -o "$archive"
    elif command -v wget >/dev/null 2>&1; then
        wget -q "$url" -O "$archive"
    else
        echo "Error: need curl or wget"
        exit 1
    fi
    
    tar xzf "$archive" -C /tmp
    cp "/tmp/rune-${PLATFORM}/rune" /usr/local/bin/rune
    chmod +x /usr/local/bin/rune
    rm -rf "$archive" "/tmp/rune-${PLATFORM}"
    
    echo "RUNE installed to /usr/local/bin/rune"
}

detect_platform
download_release
