# CLI-Referenz

Die RUNE-CLI bietet alle Funktionen direkt vom Terminal aus.

## Verwendung

```bash
rune [BEFEHL] [OPTIONEN]
```

Ohne Befehl öffnet RUNE die interaktive REPL-Shell.

## Befehle

### Verschlüsselung

| Befehl | Beschreibung |
|---|---|
| `init [passwort]` | Verschlüsselung initialisieren |
| `unlock <passwort>` | Verschlüsselung entsperren (Daemon erforderlich) |

### Daemon

| Befehl | Beschreibung |
|---|---|
| `daemon start` | Daemon im Hintergrund starten |
| `daemon foreground` | Daemon im Vordergrund starten (Debug) |
| `daemon stop` | Daemon stoppen |
| `daemon status` | Prüfen, ob der Daemon läuft |

### Prozesse

| Befehl | Beschreibung |
|---|---|
| `start <name> [--container <id>] -- <befehl>` | Verwalteten Prozess starten |
| `stop <name>` | Verwalteten Prozess stoppen |
| `restart <name>` | Verwalteten Prozess neu starten |
| `list` | Alle verwalteten Prozesse auflisten |
| `status <name>` | Prozessdetails anzeigen |
| `logs <name> [zeilen]` | Prozesslogs anzeigen |

### Container

| Befehl | Beschreibung |
|---|---|
| `container create <name> --type permanent\|temporary [--template <tpl>] [--] <befehl>` | Container erstellen |
| `container start <id>` | Container starten |
| `container stop <id>` | Container stoppen |
| `container restart <id>` | Container neu starten |
| `container list` | Alle Container auflisten |
| `container status <id>` | Containerdetails anzeigen |
| `container destroy <id>` | Container endgültig löschen |
| `container logs <id> [zeilen]` | Containerlogs anzeigen |
| `container exec <id> -- <befehl>` | Befehl in einem Container ausführen |

### Templates

| Befehl | Beschreibung |
|---|---|
| `template list` | Verfügbare Templates auflisten |
| `template create <name> <pfad>` | Template aus einem Verzeichnis erstellen |

### Service

| Befehl | Beschreibung |
|---|---|
| `install` | Als Systemdienst installieren |
| `uninstall` | Systemdienst entfernen |
