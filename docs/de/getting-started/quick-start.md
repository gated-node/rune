# Schnellstart

## 1. Verschlüsselung initialisieren

```bash
rune init
```

Richtet hardwaregebundene, zeitbasierte Verschlüsselung mit der eindeutigen Hardware-ID deines Rechners und einem benutzerdefinierten zeitbasierten Einmalcode ein.

> Kein Passwort nötig für automatisches Entsperren auf demselben Rechner.
> Für zusätzliche Sicherheit: `rune init meinpasswort`

## 2. Daemon starten

```bash
rune daemon start
```

Der Daemon läuft im Hintergrund und verwaltet alle Prozesse und Container.

## 3. Container erstellen und starten

```bash
rune container create myapp --type permanent -- node app.js
rune container start myapp
```

## 4. Isolierten Prozess starten

```bash
rune start myapp -- node app.js
```

Erstellt automatisch einen temporären Container und führt den Prozess darin aus.

## 5. Interaktive Shell

```bash
rune
```

Öffnet die interaktive RUNE-Shell (REPL) mit Befehlsverlauf und Tab-Vervollständigung.
