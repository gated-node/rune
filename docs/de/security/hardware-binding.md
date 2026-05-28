# Hardware-Bindung

RUNE bindet die Verschlüsselung an deinen spezifischen Rechner mithilfe stabiler Hardware-Identifikatoren.

## Funktionsweise

1. Während `init` liest RUNE einen Hardware-Fingerabdruck:
   - **macOS**: `IOPlatformUUID` aus der I/O Registry
   - **Linux**: `/etc/machine-id`
2. Dieser Fingerabdruck wird in der Argon2id-Schlüsselableitung verwendet
3. Der Hauptschlüssel kann nur auf demselben Rechner entschlüsselt werden

## Sicherheitsmodell

- Auf einen anderen Rechner kopierte Dateien können nicht entschlüsselt werden
- Der Zeitcode fügt einen zusätzlichen Faktor hinzu: Selbst mit derselben Hardware und demselben Passwort ist die Entschlüsselung nur im korrekten 30-Sekunden-Zeitfenster möglich
- Benachbarte Zeitfenster (±2 = ~2,5 Minuten) werden zur Tolerierung von Zeitabweichungen probiert

## Benutzerdefinierter Zeitcode (cTOTP)

Anstelle des standardmäßigen TOTP (das HMAC-SHA1 verwendet) nutzt RUNE eine eigene Implementierung:

```
cTOTP = SHA-256(zeitzaehler || seed)
```

Wobei `zeitzaehler = unix_timestamp / 30` und `seed` ein 32-Byte-Zufallswert ist, der mit dem Hardware-Fingerabdruck verschlüsselt gespeichert wird.
