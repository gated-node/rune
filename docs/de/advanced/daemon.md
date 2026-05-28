# Daemon-Verwaltung

Der RUNE-Daemon läuft im Hintergrund und verwaltet alle Prozesse und Container.

## Daemon starten

```bash
# Hintergrund (Standard)
rune daemon start

# Vordergrund (Debug/Logs sichtbar)
rune daemon foreground
```

## Daemon stoppen

```bash
rune daemon stop
```

Sendet ein gracefules Herunterfahren: stoppt alle Prozesse, stoppt alle Container, entfernt die Socket-Datei.

## Status prüfen

```bash
rune daemon status
```

## Automatisches Entsperren

Beim Start entsperrt der Daemon automatisch:
1. Erkennt Hardware-Verschlüsselungsdateien
2. Liest den Hardware-Fingerabdruck des Rechners
3. Berechnet den aktuellen Zeitcode
4. Entsperrt den Hauptschlüssel (kein Passwort nötig, wenn ohne initialisiert)
5. Fallback auf `OXYSH_PASSWORD`-Umgebungsvariable für den Legacy-Modus

## Umgebungsvariablen

| Variable | Beschreibung |
|---|---|
| `OXYSH_PASSWORD` | Passwort für den Legacy-Verschlüsselungsmodus |
| `RUST_LOG` | Log-Level (debug, info, warn, error) |

## Socket

Der Daemon lauscht auf einem Unix-Socket unter:
- `~/Library/Application Support/rune/rune.sock` (macOS)
- `~/.config/rune/rune.sock` (Linux)

## PID-Datei

Der Daemon schreibt seine PID in:
- `~/Library/Application Support/rune/rune.pid` (macOS)
- `~/.config/rune/rune.pid` (Linux)
