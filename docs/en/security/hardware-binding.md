# Hardware Binding

RUNE binds encryption to your specific machine using stable hardware identifiers.

## How It Works

1. During `init`, RUNE reads a hardware fingerprint:
   - **macOS**: `IOPlatformUUID` from I/O Registry
   - **Linux**: `/etc/machine-id`
2. This fingerprint is used in the Argon2id key derivation
3. The master key can only be decrypted on the same machine

## Security Model

- Files copied to another machine cannot be decrypted
- The time code adds an additional factor: even with the same hardware and password, decryption only works within the correct 30-second time window
- Adjacent time windows (±2 = ~2.5 minutes) are tried to handle clock drift

## Custom Time-Based Code (cTOTP)

Instead of standard TOTP (which uses HMAC-SHA1), RUNE uses a custom implementation:

```
cTOTP = SHA-256(time_counter || seed)
```

Where `time_counter = unix_timestamp / 30` and `seed` is a 32-byte random value stored encrypted with the hardware fingerprint.
