# Encryption

RUNE uses a three-layer encryption architecture for maximum security without compromising convenience.

## Architecture

```
┌─────────────────────────────────────────────┐
│           Master Key (32 bytes)             │
│   Derived from hardware + time + password   │
├─────────────────────────────────────────────┤
│         ┌─────────────────────┐             │
│         │  Container Key #1   │   ...       │
│         │   (AES-256 random)  │             │
│         └─────────┬───────────┘             │
│                   │                         │
│         Encrypted with master key           │
└─────────────────────────────────────────────┘
```

## Key Hierarchy

1. **Master Key** — 32-byte random key, stored encrypted on disk
2. **Container Keys** — One random AES-256 key per container, wrapped with the master key
3. **File Encryption** — Container data encrypted with AES-256-GCM using the container key

## Encryption Methods

### Hardware Mode (default)

```
master_key_encrypted = AES-256-GCM(
    key = Argon2id(hardware_id + TOTP + password),
    data = master_key
)
```

- **Hardware ID**: Machine-unique identifier (macOS IOPlatformUUID, Linux /etc/machine-id)
- **TOTP**: Custom SHA-256 based time code, changes every 30 seconds
- **Argon2id**: Memory-hard key derivation against brute force

### Legacy Password Mode

```
master_key_encrypted = AES-256-GCM(
    key = Argon2id(password),
    data = master_key
)
```

## Auto-Unlock

On daemon start, RUNE automatically:
1. Reads the hardware fingerprint
2. Decrypts the TOTP seed using hardware binding
3. Computes the current time code
4. Derives and decrypts the master key
5. Container operations work transparently

No manual unlock needed when hardware encryption is initialized without a password.
