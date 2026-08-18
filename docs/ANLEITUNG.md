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

- Der **Remote-Reposit­ory-Name** ist `TestJimmyDashFramworkHelloWorld`
  (Schreibweise "Framwork" ohne zweites "e" nach "w").
- Soll künftig die **korrigierte** Schreibweise `TestJimmyDashFrameworkHelloWorld`
  gewünscht sein, ist das eine **Umbenennung** — siehe unten "Umbenennung (optional)".

### Umbenennung (optional)

Nur durch einen Berechtigten (Owner/Admin) durchzuführen:

```bash
# Neues, korrekt benanntes Repo anlegen und bestehende Inhalte übertragen
gh repo create TestJimmyDashFrameworkHelloWorld --public --source . --push
```

Das **ersetzt** den alten Namen. Danach `README.md` und diese Anleitung entsprechend
aktualisieren.

---

## 7. Fehlerbehebung (Kurzfassung)

| Fehler | Ursache | Lösung |
|---|---|---|
| `dotnet: command not found` | SDK fehlt | SDK installieren (Abschnitt 1), Login/neue Shell prüfen |
| `The current .NET SDK does not support targeting .NET 8.0` | SDK-Version zu alt | SDK auf 8.0+ aktualisieren |
| Build-Fehler in `obj/`-Dateien | veraltete Build-Artefakte | `dotnet clean` dann `dotnet build` |

---

*Erstellt von Erik (techlead) — Tech Lead Entwicklung, 2026-08-18.*
