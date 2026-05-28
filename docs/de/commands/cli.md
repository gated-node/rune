# CLI Referenz
## Verschlüsselung
| Befehl | Beschreibung |
|---|---|
| `init` | Verschlüsselung initialisieren |
| `unlock <passwort>` | Verschlüsselung entsperren |
## Daemon
| Befehl | Beschreibung |
|---|---|
| `daemon start` | Daemon im Hintergrund starten |
| `daemon stop` | Daemon stoppen |
| `daemon status` | Daemon-Status prüfen |
## Prozesse
| Befehl | Beschreibung |
|---|---|
| `start <name> -- <befehl>` | Prozess starten |
| `stop <name>` | Prozess stoppen |
| `list` | Alle Prozesse auflisten |
| `logs <name> [zeilen]` | Prozesslogs anzeigen |
## Capsules
| Befehl | Beschreibung |
|---|---|
| `capsule create <name> --type permanent|temporary -- <befehl>` | Erstellen |
| `capsule start <id>` | Starten |
| `capsule stop <id>` | Stoppen |
| `capsule list` | Alle auflisten |
| `capsule destroy <id>` | Löschen |
| `capsule exec <id> -- <befehl>` | Befehl ausführen |
## Plugins
| Befehl | Beschreibung |
|---|---|
| `plugin install <name> [--url <url>]` | Plugin installieren |
| `plugin list` | Installierte auflisten |
| `plugin info <name>` | Details anzeigen |
| `plugin disable <name>` | Deaktivieren |
| `plugin enable <name>` | Aktivieren |
| `plugin remove <name>` | Entfernen |
