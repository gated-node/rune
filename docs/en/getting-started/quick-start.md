# Quick Start

## 1. Initialize Encryption

```bash
rune init
```

This sets up hardware-bound, time-based encryption using your machine's unique hardware ID and a custom time-based one-time code.

> No password needed for automatic unlock on the same machine.
> Add a password for extra security: `rune init mypassword`

## 2. Start the Daemon

```bash
rune daemon start
```

The daemon runs in the background and manages all processes and containers.

## 3. Create and Start a Container

```bash
rune container create myapp --type permanent -- node app.js
rune container start myapp
```

## 4. Run an Isolated Process

```bash
rune start myapp -- node app.js
```

This automatically creates a temporary container and runs the process inside it.

## 5. Interactive Shell

```bash
rune
```

Opens the RUNE interactive shell (REPL) with command history and tab completion.
