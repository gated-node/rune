# Service-Installation

RUNE kann als Systemdienst für den automatischen Start installiert werden.

## macOS (launchd)

```bash
rune install
```

Erstellt eine launchd-plist unter `~/Library/LaunchAgents/com.rune.daemon.plist`
mit `RunAtLoad` und `KeepAlive` aktiviert.

### Manueller Start

```bash
launchctl load ~/Library/LaunchAgents/com.rune.daemon.plist
```

### Deinstallieren

```bash
rune uninstall
```

## Linux (systemd --user)

```bash
rune install
```

Erstellt einen systemd-User-Service unter `~/.config/systemd/user/rune.service`
mit `Restart=on-failure` und `RestartSec=5`.

### Manueller Start

```bash
systemctl --user enable rune
systemctl --user start rune
```

### Deinstallieren

```bash
rune uninstall
```
