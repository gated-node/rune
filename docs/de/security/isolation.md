# Isolation

RUNE bietet Prozess- und Container-Isolation, um Interferenzen zwischen Workloads zu verhindern.

## Umgebungsvariablen

Jeder Containerprozess erhält diese Umgebungsvariablen:

| Variable | Beschreibung |
|---|---|
| `RUNE_CONTAINER=1` | Markiert den Prozess als containerisiert |
| `RUNE_CONTAINER_ID=<uuid>` | Eindeutige Container-Kennung |
| `RUNE_CONTAINER_TYPE=<typ>` | "permanent" oder "temporary" |
| `RUNE_CONTAINER_DIR=<pfad>` | Pfad zum Datenverzeichnis des Containers |

## Prozess-Isolation

- Jeder Prozess hat sein eigenes Log-Verzeichnis
- Der Prozesslebenszyklus ist unabhängig von anderen Prozessen
- Automatischer Neustart mit konfigurierbarer Richtlinie (Always, OnFailure, Never)
- Exponentielles Backoff (500ms – 30s) verhindert Neustart-Stürme

## Container-Isolation

- Separate Datenverzeichnisse pro Container
- Ruhend verschlüsselt mit pro-Container AES-256-Schlüsseln
- Temporäre Container: Daten werden beim Stoppen gelöscht
- Permanente Container: Daten bleiben erhalten und sind verschlüsselt

## Plattform-Isolation

| Plattform | Isolation |
|---|---|
| macOS | neue Session (setsid), eingeschränkter PATH |
| Linux | neue Session (setsid), eingeschränkter PATH |
| Zukunft | Linux-Namespaces, cgroups, seccomp |
