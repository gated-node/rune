# Templates

Templates stellen wiederverwendbare Basis-Dateisysteme für Container bereit.

## Template erstellen

```bash
# Aus einem Verzeichnis erstellen
rune template create nodejs /usr/local/nodejs

# Verfügbare Templates auflisten
rune template list
```

## Template-Struktur

```
~/Library/Application Support/rune/templates/<name>/
├── template.toml        # Template-Konfiguration
└── fs/                  # Kopiertes Dateisystem
```

## Template-Konfiguration (`template.toml`)

```toml
name = "nodejs"
version = "1.0.0"
description = "Node.js-Laufzeitumgebung"
default_cmd = "node"
default_args = []
isolation = "namespace"

[resource_limits]
max_memory = "512M"
max_cpu = 0.5
max_processes = 100
max_open_files = 1024
```

## Templates verwenden

Temporäre Container benötigen ein Template:

```bash
rune container create build --type temporary --template nodejs -- node build.js
```

Das Dateisystem des Templates wird als schreibgeschützte Basisschicht verwendet, mit einem beschreibbaren Overlay für Laufzeitänderungen.
