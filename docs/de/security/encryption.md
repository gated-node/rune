# Verschlüsselung

RUNE verwendet eine dreischichtige Verschlüsselungsarchitektur für maximale Sicherheit ohne Einbußen bei der Benutzerfreundlichkeit.

## Architektur

```
┌─────────────────────────────────────────────┐
│        Hauptschlüssel (32 Bytes)            │
│   Abgeleitet aus Hardware + Zeit + Passwort │
├─────────────────────────────────────────────┤
│         ┌─────────────────────┐             │
│         │  Containerschlüssel │   ...       │
│         │   (AES-256 zufällig)│             │
│         └─────────┬───────────┘             │
│                   │                         │
│         Verschlüsselt mit Hauptschlüssel    │
└─────────────────────────────────────────────┘
```

## Schlüsselhierarchie

1. **Hauptschlüssel** — 32-Byte-Zufallsschlüssel, verschlüsselt auf der Festplatte gespeichert
2. **Containerschlüssel** — Ein zufälliger AES-256-Schlüssel pro Container, mit dem Hauptschlüssel verpackt
3. **Dateiverschlüsselung** — Containerdaten mit AES-256-GCM und dem Containerschlüssel verschlüsselt

## Verschlüsselungsmethoden

### Hardware-Modus (Standard)

```
hauptschluessel_verschluesselt = AES-256-GCM(
    schluessel = Argon2id(hardware_id + TOTP + passwort),
    daten = hauptschluessel
)
```

- **Hardware-ID**: Rechner-eindeutige Kennung (macOS IOPlatformUUID, Linux /etc/machine-id)
- **TOTP**: Benutzerdefinierter SHA-256-basierter Zeitcode, alle 30 Sekunden wechselnd
- **Argon2id**: Speicherharte Schlüsselableitung gegen Brute-Force

### Legacy-Passwort-Modus

```
hauptschluessel_verschluesselt = AES-256-GCM(
    schluessel = Argon2id(passwort),
    daten = hauptschluessel
)
```

## Automatisches Entsperren

Beim Daemon-Start entsperrt RUNE automatisch:
1. Liest den Hardware-Fingerabdruck
2. Entschlüsselt den TOTP-Seed mit der Hardware-Bindung
3. Berechnet den aktuellen Zeitcode
4. Leitet den Hauptschlüssel ab und entschlüsselt ihn
5. Container-Operationen funktionieren transparent

Kein manuelles Entsperren nötig, wenn die Hardware-Verschlüsselung ohne Passwort initialisiert wurde.
