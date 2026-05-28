# Troubleshooting

## Daemon won't start

Check if the socket file already exists:

```bash
ls -la ~/Library/Application\ Support/rune/rune.sock
rm ~/Library/Application\ Support/rune/rune.sock   # remove stale socket
```

Check if another process is using the port/PID:

```bash
cat ~/Library/Application\ Support/rune/rune.pid
kill -9 $(cat ~/Library/Application\ Support/rune/rune.pid)
```

## Encryption errors

### "Master key not set"

The daemon couldn't auto-unlock. Try:

```bash
# If using hardware encryption with password:
rune unlock mypassword

# Or set the password in environment and restart:
OXYSH_PASSWORD=mypassword rune daemon restart
```

### "Auto-unlock failed"

The hardware fingerprint or time window doesn't match. This can happen if:
- The machine's hardware has changed (e.g., after a motherboard replacement)
- The system clock is significantly wrong
- The encryption files were copied from another machine

### "Wrong password"

If you forgot the password, you need to re-initialize:

```bash
rm ~/Library/Application\ Support/rune/hw_*.enc
rm ~/Library/Application\ Support/rune/master_key.enc
rune init newpassword
```

This will invalidate all existing encrypted containers.

## Container issues

### "Container not found"

Container commands use the full UUID (36 characters) or a unique prefix.
Use `rune container list` to see all container IDs.

### "Temporary containers require --template"

Temporary containers need a template. Create one first:

```bash
rune template create base /path/to/base
rune container create myapp --type temporary --template base -- node app.js
```

## Logs

Daemon logs are written to:
- `~/Library/Application Support/rune/logs/daemon.log` (macOS)
- `~/.config/rune/logs/daemon.log` (Linux)
