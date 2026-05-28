# Container-Typen

RUNE unterstützt zwei Containertypen, inspiriert von Minecraft-Cloud-Systemen.

## Permanente Container

```bash
rune container create myapp --type permanent -- node app.js
```

- **Dauerhafte Daten**: Daten im Container-Datenverzeichnis überleben Neustarts
- **Verschlüsselt**: Alle Daten mit AES-256-GCM verschlüsselt
- **Anwendungsfälle**: Datenbanken, zustandsbehaftete Anwendungen, langlebige Dienste

### Verzeichnisstruktur
```
~/Library/Application Support/rune/containers/<uuid>/
├── container.toml       # Container-Konfiguration
├── key.enc              # Verschlüsselter Containerschlüssel
├── data/                # Dauerhafte Daten (verschlüsselt)
├── logs/
│   ├── stdout.log
│   └── stderr.log
```

## Temporäre Container

```bash
rune template create base /pfad/zum/basis-dateisystem
rune container create myapp --type temporary --template base -- node app.js
```

- **Flüchtig**: Daten werden gelöscht, wenn der Container stoppt
- **Template-basiert**: Dateisystem aus einer Vorlage
- **Anwendungsfälle**: Build-Jobs, zustandslose Worker, Testumgebungen

### Verzeichnisstruktur
```
~/Library/Application Support/rune/containers/<uuid>/
├── container.toml       # Container-Konfiguration
├── overlay/
│   ├── upper/           # Beschreibbare Overlay-Ebene
│   └── work/            # Overlayfs-Arbeitsverzeichnis
├── logs/
│   ├── stdout.log
│   └── stderr.log
```
