# TestJimmyDashFramworkHelloWorld

Eine einfache **C#-Hallo-Welt-Konsolenanwendung** als Demo-/Einstiegsprojekt.

> Hinweis zur Namensgebung: Der Reposit­ory-Name `TestJimmyDashFramworkHelloWorld`
> (inkl. Schreibweise "Framwork") ist der verbindliche Remotename. Eine Umbenennung
> auf `TestJimmyDashFrameworkHelloWorld` wurde separat geprüft; siehe ANLEITUNG §6.

## Inhalt

| Pfad | Zweck |
|---|---|
| `Program.cs` | Quellcode der Hello-World-Anwendung |
| `TestJimmyDashFramworkHelloWorld.csproj` | .NET-Projektdatei (TargetFramework net8.0) |
| `build.sh` / `build.ps1` | Build- + Smoke-Test-Skripte (Linux/macOS bzw. Windows) |
| `README.md` | Diese Projektübersicht |
| `docs/ANLEITUNG.md` | Schritt-für-Schritt-Anleitung (Build, Run, Hinweise) |

## Kurzanleitung

Voraussetzung: **.NET SDK 8** (oder neuer) installiert.

```bash
dotnet build          # Projekt kompilieren
dotnet run            # "Hello, World!" ausgeben
dotnet run -- "Max"   # "Hello, Max!" ausgeben
```

Erwartete Ausgabe:

```
Hello, World!
```

### Automatischer Build + Smoke-Test (build.sh / build.ps1)

**Linux/macOS:**

```bash
bash build.sh      # build + Lauf-Check (erwartet "Hello, World!")
```

**Windows (PowerShell):**

```powershell
.\build.ps1        # build + Lauf-Check (erwartet "Hello, World!")
```

Beide Skripte setzen den dotnet-PATH automatisch (Fallback `/data/.dotnet`
bzw. `DOTNET_ROOT`), führen `dotnet build` aus und verifizieren den Lauf.
Sie beenden sich mit Fehlercode, wenn Build oder Smoke-Test fehlschlagen.

## Installationsweg (dotnet unter /data/.dotnet)

Das .NET SDK ist hier unter **`/data/.dotnet`** installiert (std. `dotnet`-
Layout: `dotnet`, `sdk/`, `shared/`). Es ist nicht automatisch im `PATH` —
für dauerhafte Nutzung eine der beiden Varianten wählen:

**Variante A — Symlink (einfach, empfohlen):**

```bash
sudo ln -s /data/.dotnet/dotnet /usr/local/bin/dotnet
dotnet --version   # sollte eine Version melden (z. B. 8.0.4xx)
```

**Variante B — PATH-Export im Shell-RC (bei `~/.bashrc` bzw. `~/.profile`):**

```bash
export DOTNET_ROOT=/data/.dotnet
export PATH="$DOTNET_ROOT:$PATH"
```

danach:

```bash
source ~/.bashrc   # bzw. neue Shell öffnen
```

> Hinweis: `build.sh` funktioniert auch ohne dauerhaften PATH-Eintrag, da es
> bei Bedarf auf `/data/.dotnet/dotnet` zurückfällt.

## Build-Status

> ✅ **Linux/macOS — verifiziert (2026-08-18):** `build.sh` bzw. `dotnet build` läuft mit
> **0 Warnings / 0 Errors** (SDK 8.0, net8.0; SDK-Pfad `/data/.dotnet`). Laufzeit bestätigt:
> `dotnet run` → `Hello, World!`, `dotnet run -- "Max"` → `Hello, Max!`. Build-Artefakte
> (`bin/`, `obj/`) sind per `.gitignore` ausgeschlossen.
>
> ⚠️ **Windows — [Offen] (nur dokumentiert, nicht real getestet):** `build.ps1` ist als
> PowerShell-Spiegel von `build.sh` angelegt. Der **reale Windows-Smoke-Test** konnte auf
> dieser (Linux-)Entwicklungsumgebung **nicht ausgeführt** werden (kein PowerShell
> /`pwsh` lokal). Er ist über einen **Windows-Dev-Rechner oder die CI-Pipeline**
> (Windows-Runner, `powershell -File build.ps1`) nachzuholen.

## Lizenz / Status

- **Status:** lauffähiges Beispielforum / Demo.
- **Autor:** Erik (techlead) — Tech Lead Entwicklung.

Weitere Details siehe [`docs/ANLEITUNG.md`](docs/ANLEITUNG.md).
