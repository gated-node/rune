# Installation

## Schnellinstall (empfohlen)

```bash
curl -fsSL https://github.com/talbergh/rune/releases/latest/download/rune-install.sh | sh
```

Installiert die vorkompilierte Binary nach `/usr/local/bin/rune`.

## Manuelle Installation

Lade das aktuelle Archiv für deine Plattform von der [Releases-Seite](https://github.com/talbergh/rune/releases) herunter:

```bash
tar xzf rune-*.tar.gz
sudo cp rune-*/rune /usr/local/bin/rune
```

## Aus dem Quellcode bauen

```bash
git clone https://github.com/talbergh/rune
cd rune
cargo build --release
sudo cp target/release/rune /usr/local/bin/rune
```

## Service-Installation

Nach der Installation kann RUNE als Systemdienst installiert werden:

```bash
# macOS (launchd)
rune install

# Linux (systemd --user)
rune install
```
