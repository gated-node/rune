# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 0.1.x   | Active development |

## Reporting a Vulnerability

Report privately via GitHub Advisory:
https://github.com/gated-node/rune/security/advisories

## Security Features

- AES-256-GCM encryption with hardware-bound keys
- TOTP time codes prevent replay attacks
- Capsule isolation via macOS sandbox (Seatbelt) or Linux namespaces (unshare)
- Plugin integrity via signature verification
- Path traversal protection in archive extraction
- Atomic file operations for PID and data files
- TOCTOU-resistant process lifecycle management
