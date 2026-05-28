# Konfiguration

RUNE benötigt keine Konfiguration, um zu funktionieren. Alle Einstellungen haben sinnvolle Standardwerte.

## Datenverzeichnis

| Plattform | Pfad |
|---|---|
| macOS | `~/Library/Application Support/rune/` |
| Linux | `~/.config/rune/` |

## Standardkonfiguration (`config/default.toml`)

```toml
[daemon]
autostart = false
log_level = "info"

[daemon.log_rotation]
max_size_mb = 10
max_files = 5

[encryption]
enabled = true
key_source = "prompt"
```

## Umgebungsvariablen

| Variable | Beschreibung |
|---|---|
| `OXYSH_PASSWORD` | Passwort für den Legacy-Verschlüsselungsmodus |
| `RUST_LOG` | Log-Level (debug, info, warn, error) |
