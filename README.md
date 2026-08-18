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

## Lizenz / Status

- **Status:** lauffähiges Beispielforum / Demo.
- **Autor:** Erik (techlead) — Tech Lead Entwicklung.

Weitere Details siehe [`docs/ANLEITUNG.md`](docs/ANLEITUNG.md).
