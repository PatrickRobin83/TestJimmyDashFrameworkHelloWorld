<!--
 * -----------------------------------------------------------------------------
 *   Filename          : ANLEITUNG.md
 *   Created By        : Erik (techlead) — Tech Lead Entwicklung
 *   Created On        : 2026-08-18
 *   Last Modified By  : Erik (techlead)
 *   Last Modified On  : 2026-08-18
 *   Beschreibung      : Schritt-für-Schritt-Anleitung für das C#-Hello-World-Projekt
 *                       TestJimmyDashFramworkHelloWorld (Build, Run, Struktur, Tests,
 *                       Repo-Hinweise).
 * -----------------------------------------------------------------------------
 -->

# Anleitung — TestJimmyDashFramworkHelloWorld

Diese Anleitung erklärt, wie du das C#-Hallo-Welt-Projekt **baust, ausführst und
erweiterst**. Sie ist so geschrieben, dass sie ohne Vorwissen nutzbar ist.

---

## 1. Voraussetzungen

| Werkzeug | Mindestversion | Prüfen mit |
|---|---|---|
| .NET SDK | **8.0** (oder neuer) | `dotnet --version` |
| Git (nur für Entwickler) | beliebig | `git --version` |

> **Hinweis:** Zum reinen **Ausführen** genügt die .NET-**Runtime**; zum **Bauen**
> (compilieren) wird das .NET **SDK** benötigt.

Installation (Beispiel, Linux/macOS):

```bash
# Linux (Debian/Ubuntu):
sudo apt-get install dotnet-sdk-8.0

# macOS (Homebrew):
brew install --cask dotnet-sdk
```

---

## 2. Projektstruktur

```
TestJimmyDashFramworkHelloWorld/
├── Program.cs                          # Quellcode (Hello-World + Begrüßung)
├── TestJimmyDashFramworkHelloWorld.csproj   # Projektdatei (net8.0)
├── README.md                           # Übersicht
├── docs/
│   └── ANLEITUNG.md                    # diese Anleitung
└── .gitignore                          # ignoriert bin/ und obj/
```

---

## 3. Build (kompilieren)

Im Projektordner:

```bash
cd TestJimmyDashFramworkHelloWorld
dotnet build
```

**Erwartete Ausgabe (Auszug):**

```
Build succeeded.
    0 Warning(s)
    0 Error(s)
```

Die fertigen Dateien liegen anschließend unter `bin/Debug/net8.0/`.

---

## 4. Run (ausführen)

```bash
dotnet run
```

**Erwartete Ausgabe:**

```
Hello, World!
```

### Mit Name (Kommandozeilen-Argument)

```bash
dotnet run -- "Max"
```

**Erwartete Ausgabe:**

```
Hello, Max!
```

> Bei `dotnet run` trennt `--` die dotnet-eigenen Optionen von den Argumenten
> deiner Anwendung.

---

## 5. Wie es funktioniert (Program.cs)

- `Main(string[] args)` ist der Einstiegspunkt.
- `BuildGreeting(string? name)` erzeugt die Begrüßungszeichenkette:
  - ohne Name: `"Hello, World!"`
  - mit Name:  `"Hello, <name>!"`
- Leere/Whitespace-Namen werden auf `"Hello, World!"` zurückgeführt (Eingabe-Robustheit).

Die Logik ist bewusst in `BuildGreeting` ausgelagert — so ist sie einfach unit-testbar,
ohne Konsolenein-/ausgabe.

---

## 6. Hinweise zur Repository-Namensgebung

- Der **Remote-Repository-Name** ist seit 18.08.2026 **`TestJimmyDashFrameworkHelloWorld`**
  (korrigierte Schreibweise, ehemals `TestJimmyDashFramworkHelloWorld` mit Tippfehler).
- Die Umbenennung wurde per `gh repo rename` durchgeführt (Owner/Admin-Recht). Die **alte URL
  leitet automatisch** auf den neuen Namen weiter — bestehende Klone/Verweise funktionieren weiter.
- **Projektdatei:** Die `.csproj`-Datei heißt bewusst weiterhin `TestJimmyDashFramworkHelloWorld.csproj`
  (interner Projekt-/AssemblyName, kein Repo-Name). Sie wurde im Zuge der Repo-Umbenennung **nicht**
  umbenannt, um Build-/Verweisseffekte zu vermeiden. Soll auch der Projektname korrigiert werden,
  ist das ein separater Build-Eingriff (eigener Auftrag).

Die frühere Option „Neues Repo anlegen und Inhalte übertragen" ist damit **überholt** —
`gh repo rename` hat den bestehenden Namen in-place korrigiert.

---

## 7. Fehlerbehebung (Kurzfassung)

| Fehler | Ursache | Lösung |
|---|---|---|
| `dotnet: command not found` | SDK fehlt | SDK installieren (Abschnitt 1), Login/neue Shell prüfen |
| `The current .NET SDK does not support targeting .NET 8.0` | SDK-Version zu alt | SDK auf 8.0+ aktualisieren |
| Build-Fehler in `obj/`-Dateien | veraltete Build-Artefakte | `dotnet clean` dann `dotnet build` |

---

*Erstellt von Erik (techlead) — Tech Lead Entwicklung, 2026-08-18.*
