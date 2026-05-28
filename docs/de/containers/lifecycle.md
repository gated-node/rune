# Container-Lebenszyklus

```
  ┌──────────┐
  │  Create  │
  └────┬─────┘
       │
  ┌────▼─────┐    ┌───────────┐
  │  Gestoppt│◄───│  Zerstören│
  └────┬─────┘    └───────────┘
       │
  ┌────▼─────┐
  │  Start   │
  └────┬─────┘
       │
  ┌────▼──────┐
  │  Läuft   │◄──────┐
  └────┬──────┘       │
       │              │
  ┌────▼─────┐   ┌────┴──────┐
  │Abgestürzt│   │ Neustart  │
  └──────────┘   └───────────┘
```

## Zustände

| Zustand | Beschreibung |
|---|---|
| `stopped` | Container existiert, Prozess läuft nicht |
| `running` | Prozess ist aktiv |
| `crashed` | Prozess mit Fehlercode beendet, max. Neustarts erreicht |
| `starting` | Prozess startet (vorübergehend) |

## Automatischer Neustart

Container können mit einer Neustart-Richtlinie konfiguriert werden:

- **Always**: Neustart unabhängig vom Exit-Code
- **OnFailure** (Standard): Neustart nur bei Fehlercode
- **Never**: Nie neu starten

Beim Neustart wird exponentielles Backoff angewendet:
`min(500ms × 2^versuch, 30s)`

## Automatische Bereinigung

Temporäre Container bereinigen automatisch ihre Overlay-Verzeichnisse beim Stoppen oder Absturz.
Permanente Container behalten ihr verschlüsseltes Datenverzeichnis.
