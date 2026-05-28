# Service Installation

RUNE can be installed as a system service for automatic startup.

## macOS (launchd)

```bash
rune install
```

This creates a launchd plist at `~/Library/LaunchAgents/com.rune.daemon.plist`
with `RunAtLoad` and `KeepAlive` enabled.

### Manual Start

```bash
launchctl load ~/Library/LaunchAgents/com.rune.daemon.plist
```

### Uninstall

```bash
rune uninstall
```

## Linux (systemd --user)

```bash
rune install
```

This creates a systemd user service at `~/.config/systemd/user/rune.service`
with `Restart=on-failure` and `RestartSec=5`.

### Manual Start

```bash
systemctl --user enable rune
systemctl --user start rune
```

### Uninstall

```bash
rune uninstall
```
