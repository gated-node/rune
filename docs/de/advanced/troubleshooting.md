# Fehlerbehebung

## Daemon startet nicht

Prüfe, ob die Socket-Datei bereits existiert:

```bash
ls -la ~/Library/Application\ Support/rune/rune.sock
rm ~/Library/Application\ Support/rune/rune.sock   # veralteten Socket entfernen
```

Prüfe, ob ein anderer Prozess die PID verwendet:

```bash
cat ~/Library/Application\ Support/rune/rune.pid
kill -9 $(cat ~/Library/Application\ Support/rune/rune.pid)
```

## Verschlüsselungsfehler

### "Master key not set"

Der Daemon konnte nicht automatisch entsperren. Versuche:

```bash
# Bei Hardware-Verschlüsselung mit Passwort:
rune unlock meinpasswort

# Oder das Passwort in der Umgebung setzen und neustarten:
OXYSH_PASSWORD=meinpasswort rune daemon restart
```

### "Auto-unlock failed"

Der Hardware-Fingerabdruck oder das Zeitfenster stimmt nicht. Dies kann passieren, wenn:
- Die Hardware des Rechners geändert wurde (z.B. nach einem Mainboard-Tausch)
- Die Systemuhr erheblich falsch geht
- Die Verschlüsselungsdateien von einem anderen Rechner kopiert wurden

### "Wrong password"

Wenn das Passwort vergessen wurde, muss neu initialisiert werden:

```bash
rm ~/Library/Application\ Support/rune/hw_*.enc
rm ~/Library/Application\ Support/rune/master_key.enc
rune init neuespasswort
```

Dadurch werden alle vorhandenen verschlüsselten Container ungültig.

## Container-Probleme

### "Container not found"

Container-Befehle verwenden die vollständige UUID (36 Zeichen) oder ein eindeutiges Präfix.
Verwende `rune container list`, um alle Container-IDs zu sehen.

### "Temporary containers require --template"

Temporäre Container benötigen ein Template. Erstelle zuerst eines:

```bash
rune template create base /pfad/zum/basis
rune container create myapp --type temporary --template base -- node app.js
```

## Logs

Daemon-Logs werden geschrieben unter:
- `~/Library/Application Support/rune/logs/daemon.log` (macOS)
- `~/.config/rune/logs/daemon.log` (Linux)
